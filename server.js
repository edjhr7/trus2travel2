////////////////////////////////////////////
//              THE BRIDGE                //
//                                        //
//    CREW CHALLENGE PROJECT Sept 2020    //
//             TRUST2TRAVEL               //
////////////////////////////////////////////
//                                        //
//Developer:                              //
//  Vicente Alejandro Garcerán Blanco     //
//  vagb.fullstack@gmail.com              //
//                                        //
//*See Readme.md file for complete team   //
//reference                               //
//                                        //
//    Main Express backend server file    //
//                                        //
////////////////////////////////////////////

//---------------MODULES------------------//
const dotenv        = require('dotenv');
const express       = require("express");
const bodyParser    = require("body-parser");
const corsEnable    = require("cors");
const cookieParser  = require("cookie-parser");
const mysql         = require("mysql");
const fetch         = require("node-fetch");
const Validator     = require("./lib/validatorNode.class");
const bcrypt        = require("bcrypt");
const {google}      = require("googleapis");
const JWT           = require("./lib/jwt");
const nodemailer    = require('nodemailer');
//------------INITIALIZATION--------------//
//Loading of environment variables
dotenv.config();

//Creation of Express server object
const serverObj = express();

//serverObj.set("trust proxy", true);

//Raise Express server on listening port
serverObj.listen(process.env.PORT || process.env.PORTBACK || 8888, () => {console.log(`Express server listening on port ${process.env.PORT} if deployed; ${process.env.PORTBACK} if local`)});

//OAuth2 client for Google
let googleOAuth2Client = undefined;

//Data connection to MySQL
const connectionData = {
    "host" : process.env.DB_HOST,
    "user" : process.env.DB_USER,
    "password" : process.env.DB_PASSWORD,
    "database" : process.env.DB_DATABASE
};

//-------------MIDDLEWARES----------------//
//const publicFiles = express.static("src");//For developing
const publicFiles = express.static(__dirname + "/build");//For production
serverObj.use(publicFiles);
serverObj.use(bodyParser.urlencoded({"extended" : false}));
serverObj.use(bodyParser.json());
serverObj.use(corsEnable());
serverObj.use(cookieParser());

//-------------FUNCTIONS----------------//
const validateData = (dataJSON) => {
    if (dataJSON === undefined || dataJSON === null) {
		return {"ret" : false, "caption" : "Datos de registro no definidos!"};
    }
    
    const validator = new Validator(); 
    let validatorOutput = undefined;

    const data = Object.entries(dataJSON);

    data.some(entry => {
        let [type, value] = [...entry];
        switch(type)
        {
            case "email":
            {
                validatorOutput = validator.ValidateEmail(value);
                break;
            }
            case "password":
            {
                validatorOutput = validator.ValidatePassword(value, /^(?=.*[*@%$&]*.*)(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z*@%$&]{6,}$/);
                if (!validatorOutput.ret)
                {
		            validatorOutput.caption = "Debe tener 6 caracteres como mínimo y contener números y letras";
	            }//if
                break;
            }
            case "dateBirth":
            {
                validatorOutput = validator.ValidateDate(value);
                break;
            }
            case "gender":
            {
                validatorOutput = validator.ValidateOption(value, ["masculino", "femenino", "otro"]);
                break;
            }
            default:
            {
                break;
            }
        }//switch
        return !validatorOutput.ret;
    });

    if (!validatorOutput.ret)
    {
		return validatorOutput.caption;
	}//if
    return {ret : true, caption : ""};
}//validateData

const connectorDB = (dbms, connectionData) => {
	let connectionDB = null;
	switch (dbms) {
	case "MySQL":
        {
            const prom = new Promise((resolve, reject) => {
                if (mysql !== undefined)
                {
                    if (typeof connectionData !== "object")
                    {
                        reject({"ret" : 0, "msg" : "MySQL connection data is not a valid JSON"});
                    }//if
                    try { connectionDB = mysql.createConnection(connectionData); }
                    catch (e) { reject({"ret" : 0, "msg" : `Unable to create MySQL connection. Please check connection data is correct`});
                    }
                    if (connectionDB)
                    {
                        connectionDB.connect(function(err) {
                            if (err)
                            {
                                reject({"ret" : 0, "msg" : err});
                            }//if
                            resolve(connectionDB);
                        });
                    }//if
                }//if
                else
                {
                    reject({"ret" : 0, "msg" : `MySQL connection failed. MySQL driver not found`});
                }//else
            });
            return prom;
        }
	case "Mongo":
        {
            break;
        }
    default:
        {
            break;
        }
	}
};//connectorDB

const createGoogleOAuth = (url) => {
    //Retrieve previously stored credentials for accessing Google auth service
    let GOOGLE_CLIENT_SECRET    = `${process.env.GOOGLE_CLIENT_SECRET}`;
    let GOOGLE_CLIENT_ID        = `${process.env.GOOGLE_CLIENT_ID}`;
    //Creation of an OAuth2 client for the application
    //This object is in charge of communication with Google auth service
    return new google.auth.OAuth2(
        GOOGLE_CLIENT_ID,
        GOOGLE_CLIENT_SECRET,
        //This is the url Google will call once the permissions are granted
        url
        //"http://localhost:8888/login/Google"
    );
};//createGoogleOAuth

const getGoogleOAuthUrl = (oauthClient) => {
    //Define scopes for data retrieving
	const scopes = [
		"https://www.googleapis.com/auth/userinfo.profile",
		"https://www.googleapis.com/auth/userinfo.email",
	];
    //Return the url to redirect the user to ask for permissions on Google
	return oauthClient.generateAuthUrl({
		"access_type": "offline",
		"prompt": "consent",
		//A single scope can be passed as string
		"scope": scopes
	});
};//getGoogleOAuthUrl

//OAuth2 client for nodemailer
const oauth2Nodemailer = createGoogleOAuth("https://developers.google.com/oauthplayground");
oauth2Nodemailer.setCredentials({
    refresh_token: `${process.env.GOOGLE_MAIL_REFRESH_TOKEN}`
});

//-----------SERVER ROUTING---------------//
//REGISTER NEW USER (POST)
serverObj.post("/register", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. Se ha producido un error durante el proceso de registro y no ha sido posible completarlo. Inténtalo de nuevo más tarde.";
    //---VALIDATION OF NEW USER´S DATA--//
    const validationResults = validateData(req.body);
    if (validationResults.ret !== true)
    {
        //Data validation fails --> Exit sending error information
        res.send(validationResults);
    }//if
    else
    {
        //Validation succeedes --> GO ON
        //--CREATE A CONNECTION WITH DB--//
        connectorDB("MySQL", connectionData)
        .then((connectionDB) => {
            //Created connection with DB --> GO ON
            //--CHECK OUT IF NEW USER ALREADY EXISTS IN DB--//
            try {
                connectionDB.query({
                    sql : "SELECT u.USRID, p.PERFIL FROM usuarios AS u LEFT JOIN perfiles AS p ON u.USRID = p.EXT_USRID WHERE u.EMAIL LIKE ?",
                    values : [req.body.email]},
                    function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        if (result[0].PERFIL === 'registrado')
                        {
                            console.log("Eliminación de conexión con BD tras comprobar que el usuario ya está registrado");
                            connectionDB.end();
                            //Found user in DB --> No registering and exit
                            res.send({"ret" : false, "caption" : "Usuario ya registrado!"});
                        }//if
                        else
                        {
                            //User previously registered from oauth
                            //Hash the password
                            bcrypt.hash(req.body.password, 10)
                            .then(hash => {
                                connectionDB.query({
                                    sql : `INSERT INTO perfiles(EXT_USRID, PERFIL, PASS)
                                                VALUES (?, ?, ?)`,
                                    values : [result[0].USRID, "registrado", hash]}, 
                                    function (err, results) {
                                        if (err)
                                        {
                                            //Query failed
                                            throw err;
                                        }//if
                                        else if (results.affectedRows)
                                        {
                                            res.send({"ret" : true, "caption" : `${process.env.URLFRONT}login/confirm`});
                                        }//else
                                    })
                            .catch(fail => {
                                console.log("Eliminación de conexión con BD tras error de creación de hash de contraseña");
                                connectionDB.end();
                                //Password hash KO --> exit
                                console.log("Fallo al encriptar la contraseña",fail);
                                res.send({"ret" : false, "caption" : failMsg});
                                });
                            });
                        }//else
                    }//else if
                    else
                    {
                        //New user not found in DB --> GO ON
                        //--STORE THE USER IN THE DB--//
                        //Hash the password
                        bcrypt.hash(req.body.password, 10)
                            .then(hash => {
                                //Password hashed OK --> GO ON
                                //Create a hash to confirm registration
                                bcrypt.hash(req.body.email, 10)
                                .then(hashConfirm => {
                                    //Hash token created --> GO ON
                                    hashConfirm = hashConfirm.replace(/\//g, "A");
                                    //--OPEN A TRANSACTION TO INSERT IN DB--//
                                    connectionDB.beginTransaction(function(err) {
                                        if (err)
                                        {
                                            //Transaction failed --> Exit and inform
                                            throw err;
                                        }//if
                                        else
                                        {
                                            //--INSERT NEW USER IN USERS TABLE--//
                                            connectionDB.query({
                                                sql : `INSERT INTO
                                                            usuarios(USRID, EMAIL, FECHANACIMIENTO, GENERO, CONFIRMACIONREGISTRO)
                                                            VALUES (NULL, ?, ?, ?, ?)`,
                                                values : [req.body.email, req.body.dateBirth, req.body.gender, hashConfirm]}, 
                                                function (err, results) {
                                                    if (err)
                                                    {
                                                        //Error in query --> rollback
                                                        return connectionDB.rollback(function() {
                                                            throw err;
                                                        });
                                                    }//if
                                                    else
                                                    {
                                                        //--INSERT PROFILE FOR THE USER IN PROFILES TABLE--//
                                                        connectionDB.query({
                                                            sql : `INSERT INTO 
                                                                        perfiles(EXT_USRID, PERFIL, PASS)
                                                                        VALUES (?, ?, ?)`,
                                                            values : [results.insertId, "registrado", hash]}, 
                                                            function (err, results) {
                                                                if (err)
                                                                {
                                                                    //Error in query --> rollback
                                                                    return connectionDB.rollback(function() {
                                                                        throw err;
                                                                    });
                                                                }//if
                                                                else
                                                                {
                                                                    //--COMMIT TRANSACTION--//
                                                                    connectionDB.commit(function(err) {
                                                                        if (err)
                                                                        {
                                                                            //Commit failed --> rollback
                                                                            return connectionDB.rollback(function() {
                                                                                throw err;
                                                                            });
                                                                        }//if
                                                                        else
                                                                        {
                                                                            //Transaction committed --> Send confirmation email to the user
                                                                            //Send confirmation mail to new user
                                                                            async function main() {
                                                                                const accessToken = oauth2Nodemailer.getAccessToken();
                                                                                let transporter = nodemailer.createTransport({
                                                                                    service: 'Gmail',
                                                                                    auth: {
                                                                                        type: "OAuth2",
                                                                                        user: "trust2travel@gmail.com", 
                                                                                        clientId: `${process.env.GOOGLE_CLIENT_ID}`,
                                                                                        clientSecret: `${process.env.GOOGLE_CLIENT_SECRET}`,
                                                                                        refreshToken: `${process.env.GOOGLE_MAIL_REFRESH_TOKEN}`,
                                                                                        accessToken: accessToken
                                                                                   },
                                                                                    /*auth: {
                                                                                        user: 'trust2travel@gmail.com',
                                                                                        pass: 'oauthtrust2travel'
                                                                                    },*/
                                                                                    tls : { rejectUnauthorized: false }
                                                                                });

                                                                                await transporter.sendMail({
                                                                                from: 'trust2travel@gmail.com',
                                                                                to: req.body.email,
                                                                                subject: "Confirmación del proceso de registro",
                                                                                text: "",
                                                                                html: `<p>Este correo ha sido enviado desde trust2travel para confirmar el proceso de registro</p>
                                                                                <p>Haga click en <a href='${process.env.URLBACK}confirm/${hashConfirm}'>este enlace</a> para aceptar el registro y será conducido a la aplicación</p>`,
                                                                                });
                                                                                //console.log("Message sent: ", info.messageId);
                                                                            }
                                                                            main().catch(console.error());
                                                                            console.log("Eliminación de conexión con BD tras finalizar la operación con éxito");
                                                                            connectionDB.end();
                                                                            //ESTA LLAMADA DE REDIRECCIONAMIENTO FUNCIONA
                                                                            res.send({"ret" : true, "caption" : `${process.env.URLFRONT}infoPage/register`});
                                                                            //ESTA LLAMADA DE REDIRECCIONAMIENTO NO CRUZA POR FALLO DE CORS
                                                                            //res.redirect(`${process.env.URLFRONT}infoPage`);
                                                                        }//else
                                                                    });//commit
                                                                }//else
                                                            });
                                                    }//else                                    
                                                });
                                        }//else
                                    });
                                }).catch(fail => {
                                    //Confirm hash KO --> exit
                                    console.log("Eliminación de conexión con BD tras error de creación de hash de confirmación");
                                    connectionDB.end();
                                    console.log("Fallo al encriptar la confirmación del registro",fail);
                                    res.send({"ret" : false, "caption" : failMsg});
                                });			
                            }).catch(fail => {
                                console.log("Eliminación de conexión con BD tras error de creación de hash de contraseña");
                                connectionDB.end();
                                //Password hash KO --> exit
                                console.log("Fallo al encriptar la contraseña",fail);
                                res.send({"ret" : false, "caption" : failMsg});
                            });			
                    }//else
                })
            } catch(err){
                console.log("Eliminación de conexión con BD tras error de sentencia SQL");
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
        }).catch((fail) => {
            //The connection with DB failed --> Exit sending error information
            console.log("Fallo de conexión con la BD",fail);
            res.send({"ret" : false, "caption" : failMsg});
        });
    }//else  
});

//CONFIRMATION OF REGISTER PROCESS (GET)
serverObj.get("/confirm/:Token", (req, res) => {
    const confirmationToken = req.params.Token;
    //Check out the received token inside users table
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        try {
        //DB connection OK --> Check if token exists in users table
        connectionDB.query({
            sql : "SELECT USRID FROM usuarios WHERE CONFIRMACIONREGISTRO LIKE ?",
            values : [confirmationToken]},
            function (err, result) {
                if (err)
                {
                    //Query KO --> error
                    throw err;
                    //TODO: TRATAR EL ERROR Y REDIRIGIR A /
                }//if
                else if (result.length)
                {
                    //Found token in DB --> Update confirmation
                    connectionDB.query({
                        sql : "UPDATE usuarios SET CONFIRMACIONREGISTRO = NULL WHERE USRID  = ?",
                        values : [result[0].USRID]},
                        function (err, result) {
                            if (err)
                            {
                                //Query KO --> error
                                throw err;
                            }//if
                            else if (result.changedRows)
                            {
                                connectionDB.end();
                                //TODO: ACTUALIZADA CONFIRMACIÓN --> REDIRECCIÓN AL LOGIN
                                res.redirect(`${process.env.URLFRONT}login/confirm`);
                            }//else if
                        });
                }
            });
        } catch(err){
            connectionDB.end();
            console.log("Fallo en sentencia SQL",err);
            res.status(500).send({error: 'Se ha producido un error en el proceso de confirmación'})
        }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        console.log("Fallo de conexión con la BD",fail);
        //SI EL PROCESO DE CONFIRMACIÓN FALLA, POR EJEMPLO, POR FALLAR LA CONEXIÓN CON LA BD, ENTONCES ¿CÓMO AVISAMOS AL USUARIO DE QUE SU REGISTRO NO SE HA PODIDO CONFIRMAR?¿SE LE ENVÍA OTRO EMAIL INFORMANDO DE ELLO? LO QUE NO PARECE TENER SENTIDO ES ENVIAR UNA RESPUESTA CON res.send
        res.status(500).send({error: 'Se ha producido un error en el proceso de confirmación'})
    });
});

//CREDENTIALS CHECKOUT (POST)
serverObj.post("/login", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. Se ha producido un error durante el proceso de login y no ha sido posible completarlo. Inténtalo de nuevo más tarde.";
    //---VALIDATION OF USER´S LOGIN DATA--//
    const validationResults = validateData(req.body);
    if (validationResults.ret !== true)
    {
        //Data validation fails --> Exit sending error information
        res.send(validationResults);
    }//if
    else
    {
        //Validation succeedes --> GO ON
        //--CREATE A CONNECTION WITH DB--//
        connectorDB("MySQL", connectionData)
		.then((connectionDB) => {
            //Created connection with DB --> GO ON
            //--CHECK IF USER IS REGISTERED--//
            try {
			    connectionDB.query({
                    sql : "SELECT USRID, CONFIRMACIONREGISTRO, ONBOARDING FROM usuarios WHERE EMAIL LIKE ?",
                    values : [req.body.email]},
                    function (err, resultA) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (resultA.length)
                    {
                        //The user is a registered one --> GO ON
                        //--CHECK IF USER IS PENDING OF CONFIRMATION--//
                        if (resultA[0].CONFIRMACIONREGISTRO === null)
                        {
                            //User is confirmed --> GO ON
                            //--RETRIEVE THE PASSWORD--//
                            connectionDB.query({
                                sql : "SELECT PASS FROM perfiles WHERE EXT_USRID = ? AND PERFIL = 'registrado'",
                                values : [resultA[0].USRID]},
                                function (err, resultB) {
                                if (err)
                                {
                                    //Query failed
                                    throw err;
                                }//if
                                else if (resultB[0].PASS)
                                {
                                    //The password is found for target user and profile --> GO ON
                                    //--COMPARE THE INSERTED PASSWORD WITH THE STORED ONE--//
                                    bcrypt.compare(req.body.password, resultB[0].PASS)
                                        .then(hashResult => {
                                            if (hashResult)
                                            {
                                                //Passwords match --> GO ON
                                                //--CREATE SESSION WITH A JWT--//
                                                const Payload = {
                                                    "user" : req.body.email,
                                                    "iat" : new Date()
                                                };
                                                const jwt = JWT.buildJWT(Payload);
                                                //--CHECK THE ONBOARDING CONDITION--//
                                                if (resultA[0].ONBOARDING)
                                                {
                                                    //Is the first access so update the onboarding flag and redirect to the onboarding page
                                                    connectionDB.query({
                                                        sql : "UPDATE usuarios SET ONBOARDING = '0' WHERE USRID = ?",
                                                        values : [resultA[0].USRID]},
                                                        function (err, resultUpdateOnboarding) {
                                                            if (err)
                                                            {
                                                                //Query failed
                                                                throw err;
                                                            }//if
                                                            else if (resultUpdateOnboarding)
                                                            {
                                                                //The onboarding flag has been properly updated
                                                                connectionDB.end();
                                                                //Send JWT to the browser
                                                                res.send({"ret" : 1, "caption" : jwt});
                                                                //res.cookie("JWT", jwt)//, {"httpOnly" : true})
                                                                //.redirect(`${process.env.URLFRONT}revista`);
                                                            }//else if
                                                            else
                                                            {
                                                                //The update of onboarding flag could not be accomplished
                                                                connectionDB.end();
                                                                console.log("Error al actualizar el flag de onboarding ",failMsg);
                                                                res.send({"ret" : 0, "caption" : failMsg});
                                                                //res.send({"ret" : false, "caption" : failMsg});
                                                            }//else
                                                        });
                                                }//if
                                                else
                                                {
                                                    connectionDB.end();
                                                    //Is not the first access so redirect to the home page
                                                    //Send JWT to the browser
                                                    //res.cookie("JWT", jwt)
                                                    res.send({"ret" : 2, "caption" : jwt});
                                                    //res.cookie("JWT", jwt)//, {"httpOnly" : true})
                                                    //.send({"ret" : true, "caption" : jwt});
                                                }//else
                                            }//if
                                            else
                                            {
                                                connectionDB.end();
                                                //Passwords don´t match --> Reject
                                                res.send({"ret" : 0, "caption" : "Contraseña inválida!"});
                                            }//else
                                        })
                                        .catch(fail => {
                                            connectionDB.end();
                                            console.log("Error interno de la función de comparación de la contraseña");
                                            //No password found for this profile --> Reject
                                            res.send({"ret" : 0, "caption" : "Lo sentimos. Se ha producido un error durante el proceso de login y no ha sido posible completarlo. Inténtalo de nuevo más tarde."});
                                        });
                                }//else if
                                else
                                {
                                    connectionDB.end();
                                    //No password found for this profile --> Reject
                                    res.send({"ret" : 0, "caption" : "No se ha encontrado contraseña para este usuario!"});
                                }//else
                            });                            
                        }//if
                        else
                        {
                            connectionDB.end();
                            //The user is trying to access but still pending of confirmation --> Reject and inform
                            res.send({"ret" : 0, "caption" : "No puedes acceder hasta que no confirmes tu registro"});
                        }//else
                    }//else if
                    else
                    {
                        connectionDB.end();
                        //Not found user in DB --> Reject login
                        res.send({"ret" : 0, "caption" : "Usuario no registrado!"});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : 0, "caption" : failMsg});
            }
        }).catch((fail) => {
           //The connection with DB failed --> Exit sending error information
           console.log("Fallo de conexión con la BD",fail);
           res.send({"ret" : 0, "caption" : failMsg});
        });
    }//else
});

//GET USER SESSION (POST)
serverObj.post("/getUsr", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. No se ha podido completar la búsqueda requerida";
    res.send(JWT.checkJWT(req.body.JWT));
});

//OAUTH LOGIN REQUEST USING GOOGLE (GET)
serverObj.get("/loginGoogle", (req, res) => {
    //Creation of Google OAuth2 client
    googleOAuth2Client = createGoogleOAuth(`${process.env.URLBACK}login/Google`);
    //Redirect the user to Google auth permissions
    let a = getGoogleOAuthUrl(googleOAuth2Client);
    console.log(a);
    res.send(a);
    //res.redirect(a);
});

//OAUTH LOGIN REQUEST USING FACEBOOK (GET)
serverObj.get("/loginFacebook", (req, res) => {
    
});

//OAUTH LOGIN (GET)
serverObj.get("/login/:Provider", (req, res) => {
    const provider = req.params.Provider;
    let oauthUserData = undefined;
    switch (provider)
    {
        case "Google":
            {
                if (googleOAuth2Client)
                {
                    const {code} = req.query;
                    if (code)
                    {
                        const p = new Promise((resolve, reject) => {
                            resolve(googleOAuth2Client.getToken(code));
                        });
                        p.then((dataFromGoogle) => {
                            const { tokens } = dataFromGoogle;
                            googleOAuth2Client.setCredentials(tokens);
                            if (tokens.id_token && tokens.access_token) {
                                // Fetch the user's profile with the access token and bearer
                                try {
                                    fetch(`https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=${tokens.access_token}`, {
                                            headers : {
                                                'Authorization': `Bearer ${tokens.id_token}`
                                            }
                                        })
                                        .then(resG => resG.json())
                                        .then(dataG => {
                                            //At this point Google has given required user´s data
                                            oauthUserData = dataG;

                                            //Check if this user is a registered one
                                            //--CREATE A CONNECTION WITH DB--//
                                            connectorDB("MySQL", connectionData)
                                            .then((connectionDB) => {
                                                //Created connection with DB --> GO ON
                                                //--CHECK IF USER IS REGISTERED--//
                                                try {
                                                    connectionDB.query({
                                                        sql : "SELECT USRID, CONFIRMACIONREGISTRO, ONBOARDING FROM usuarios WHERE EMAIL LIKE ?",
                                                        values : [oauthUserData.email]},
                                                        function (err, resultA) {
                                                        if (err)
                                                        {
                                                            //Query failed
                                                            throw err;
                                                        }//if
                                                        else if (resultA.length)
                                                        {
                                                            //The user is a registered one --> GO ON
                                                            //--CHECK IF USER IS PENDING OF CONFIRMATION--//
                                                            if (resultA[0].CONFIRMACIONREGISTRO === null)
                                                            {
                                                                //User is confirmed --> GO ON
                                                                //--CREATE SESSION WITH A JWT--//
                                                                const Payload = {
                                                                    "user" : oauthUserData.email,
                                                                    "iat" : new Date()
                                                                };
                                                                const jwt = JWT.buildJWT(Payload);
                                                                //--CHECK THE ONBOARDING CONDITION--//
                                                                if (resultA[0].ONBOARDING)
                                                                {
                                                                    //Is the first access so update the onboarding flag and redirect to the onboarding page
                                                                    connectionDB.query({
                                                                        sql : "UPDATE usuarios SET ONBOARDING = '0' WHERE USRID = ?",
                                                                        values : [resultA[0].USRID]},
                                                                        function (err, resultUpdateOnboarding) {
                                                                            if (err)
                                                                            {
                                                                                //Query failed
                                                                                throw err;
                                                                            }//if
                                                                            else if (resultUpdateOnboarding)
                                                                            {
                                                                                //The onboarding flag has been properly updated
                                                                                connectionDB.end();
                                                                                //Send JWT to the browser
                                                                                res.cookie("JWT", jwt)//, {"httpOnly" : true})
                                                                                .redirect(`${process.env.URLFRONT}revista`);
                                                                            }//else if
                                                                            else
                                                                            {
                                                                                //The update of onboarding flag could not be accomplished
                                                                                connectionDB.end();
                                                                                console.log("Error al actualizar el flag de onboarding ",failMsg);
                                                                                res.redirect(`${process.env.URLFRONT}infoPage`);
                                                                            }//else
                                                                        });
                                                                }//if
                                                                else
                                                                {
                                                                    connectionDB.end();
                                                                    //Is not the first access so redirect to the home page
                                                                    console.log("se fija cookie",jwt);
                                                                    res.cookie("JWT", jwt)
                                                                    .redirect(`${process.env.URLFRONT}home`);
                                                                }//else                         
                                                            }//if
                                                            else
                                                            {
                                                                connectionDB.end();
                                                                //The user is trying to access but still pending of confirmation --> Reject and inform
                                                                res.redirect(`${process.env.URLFRONT}infoPage/FailOAuth`);
                                                            }//else
                                                        }//else if
                                                        else
                                                        {
                                                            //The user is not a registered one
                                                            //Is validated by Google so create a pseudo-register
                                                            connectionDB.beginTransaction(function(err) {
                                                                if (err)
                                                                {
                                                                    //Transaction failed --> Exit and inform
                                                                    throw err;
                                                                }//if
                                                                else
                                                                {
                                                                    //--INSERT NEW USER IN USERS TABLE--//
                                                                    connectionDB.query({
                                                                        sql : `INSERT INTO usuarios(EMAIL, GENERO, ONBOARDING) VALUES (?, ?, ?)`,
                                                                        values : [oauthUserData.email, 'otro', 1]}, 
                                                                        function (err, results) {
                                                                            if (err)
                                                                            {
                                                                                //Error in query --> rollback
                                                                                return connectionDB.rollback(function() {
                                                                                    throw err;
                                                                                });
                                                                            }//if
                                                                            else
                                                                            {
                                                                                //--INSERT PROFILE FOR THE USER IN PROFILES TABLE--//
                                                                                connectionDB.query({
                                                                                    sql : `INSERT INTO perfiles(EXT_USRID, PERFIL) VALUES (?, ?)`,
                                                                                    values : [results.insertId, "oauth"]}, 
                                                                                    function (err, results) {
                                                                                        if (err)
                                                                                        {
                                                                                            //Error in query --> rollback
                                                                                            return connectionDB.rollback(function() {
                                                                                                throw err;
                                                                                            });
                                                                                        }//if
                                                                                        else
                                                                                        {
                                                                                            //--COMMIT TRANSACTION--//
                                                                                            connectionDB.commit(function(err) {
                                                                                                if (err)
                                                                                                {
                                                                                                    //Commit failed --> rollback
                                                                                                    return connectionDB.rollback(function() {
                                                                                                        throw err;
                                                                                                    });
                                                                                                }//if
                                                                                                else
                                                                                                {
                                                                                                    //Transaction committed
                                                                                                    connectionDB.end();
                                                                                                    //--CREATE SESSION WITH A JWT--//
                                                                                                    const Payload = {
                                                                                                        "user" : oauthUserData.email,
                                                                                                        "iat" : new Date()
                                                                                                    };
                                                                                                    const jwt = JWT.buildJWT(Payload);
                                                                                                    res.cookie("JWT", jwt)
                                                                                                    .redirect(`${process.env.URLFRONT}revista`);
                                                                                                }//else
                                                                                            });//commit
                                                                                        }//else
                                                                                    });
                                                                            }//else                                    
                                                                        });
                                                                }//else
                                                            });
                                                        }//else
                                                    });
                                                } catch(err){
                                                    connectionDB.end();
                                                    console.log("Fallo en sentencia SQL",err);
                                                    res.redirect(`${process.env.URLFRONT}infoPage/GenericError`);
                                                }
                                            }).catch((fail) => {
                                            //The connection with DB failed --> Exit sending error information
                                            console.log("Fallo de conexión con la BD",fail);
                                            res.redirect(`${process.env.URLFRONT}infoPage/GenericError`);
                                            });
                                        });
                                } catch (error) {
                                    console.log(error);
                                    // throw new Error(error.message);
                                    res.redirect(`${process.env.URLFRONT}infoPage/GenericError`);
                                }
                            }//if
                            else
                            {
                                //No data for token generation --> exit
                                res.redirect(`${process.env.URLFRONT}infoPage/GenericError`);
                            }//else
                        })
                    }//if
                }//if
                else
                {
                    //No oauth client ready --> exit
                    console.log('no hay cliente oauth');
                    res.redirect(`${process.env.URLFRONT}infoPage/GenericError`);
                }//else
                break;
            }
        case "Facebook":
            {
                break;
            }
        default:
            {
                break;
            }
    }//switch
});

//EMAIL CHECKOUT FOR PASSWORD RESET (POST)
serverObj.post("/checkEmail", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. En este momento no se puede hacer el cambio de contraseña. Inténtalo de nuevo más tarde.";
    //---VALIDATION OF USER´S EMAIL--//
    const validationResults = validateData(req.body);
    if (validationResults.ret !== true)
    {
        //Data validation fails --> Exit sending error information
        res.send(validationResults);
    }//if
    else
    {
        //Validation succeedes --> GO ON
        //--CREATE A CONNECTION WITH DB--//
        connectorDB("MySQL", connectionData)
		.then((connectionDB) => {
            //Created connection with DB --> GO ON
            //--CHECK OUT IF NEW USER ALREADY EXISTS IN DB--//
            try {
			    connectionDB.query({
                    sql : "SELECT USRID, CONFIRMACIONREGISTRO, PENDINGRESETPASS FROM usuarios WHERE EMAIL LIKE ?",
                    values : [req.body.email]},
                    function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        //Found user in DB --> GO ON
                        //--CHECK OUT IF USER IS PENDING OF CONFIRMATION--//
                        if (result[0].CONFIRMACIONREGISTRO !== null)
                        {
                            connectionDB.end(); 
                            //User requests pass change but has not confirmed registration yet --> Reject and inform
                            res.send({"ret" : false, "caption" : "Debes confirmar el registro antes de cambiar la contraseña. Revisa el correo con el que te registraste"});
                        }//if
                        else
                        {
                            //Hash the email and insert it in this user´s register
                            bcrypt.hash(req.body.email, 10)
                            .then(hash => {
                                hash = hash.replace(/\//g, "A");
                                connectionDB.query({
                                    sql : `UPDATE usuarios SET PENDINGRESETPASS = ? WHERE USRID = ?`,
                                    values : [hash, result[0].USRID]},
                                    function (err, result) {
                                        if (err)
                                        {
                                            //Query failed
                                            throw err;
                                        }//if
                                        else if (result.affectedRows)
                                        {
                                            connectionDB.end(); 
                                            //The token to change password is stored --> GO ON
                                            //--SEND AN EMAIL TO USER WITH A LINK TO UPDATE THE PASSWORD--//
                                            async function main() {
                                                let transporter = nodemailer.createTransport({
                                                    service: 'Gmail',
                                                    auth: {
                                                        user: 'trust2travel@gmail.com',
                                                        pass: 'oauthtrust2travel'
                                                    },
                                                    tls : { rejectUnauthorized: false }
                                                });
                                            
                                                await transporter.sendMail({
                                                from: 'trust2travel@gmail.com',
                                                to: req.body.email,
                                                subject: "Cambio de contraseña para trust2travel",
                                                text: "Por favor, acuda al siguiente link para generar una nueva contraseña:",
                                                html: `<a href='${process.env.URLBACK}resetPass/${hash}'>cambiar contraseña</a>`,
                                                });
                                                //console.log("Message sent: ", info.messageId);
                                            }
                                            main().catch(console.error);
                                            //ESTA LLAMADA DE REDIRECCIONAMIENTO FUNCIONA
                                            res.send({"ret" : true, "caption" : `${process.env.URLFRONT}infoPage/reset`});
                                            //ESTA LLAMADA DE REDIRECCIONAMIENTO NO CRUZA POR FALLO DE CORS
                                            //res.redirect(`${process.env.URLFRONT}infoPage`);
                                        }//else if
                                    });
                                })
                            .catch(fail => {
                                connectionDB.end(); 
                                //Token creation failed --> Exit
                                console.log("Fallo al crear el hash para el token de cambio de contraseña",fail);
                                res.send({"ret" : false, "caption" : failMsg});
                            });
                        }//else
                    }//else if
                    else
                    {
                        connectionDB.end(); 
                        //Not found user in DB --> Reject
                        res.send({"ret" : false, "caption" : "El email introducido no se encuentra registrado!"});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }       
        })
        //DB connection KO --> exit
		.catch((fail) => {
            //The connection with DB failed --> Exit sending error information
            console.log("Fallo de conexión con la BD",fail);
            res.send({"ret" : false, "caption" : failMsg});
		});
    }//else
});

//RESET PASSWORD (GET)
serverObj.get("/resetPass/:Token", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. En este momento no se puede hacer el cambio de contraseña. Inténtalo de nuevo más tarde.";
    const emailToken = req.params.Token;
    //Check out the received token inside users table
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        //--CHECK IF TOKEN EXISTS IN USERS TABLE--//
        try {
            connectionDB.query({
                sql : "SELECT USRID FROM usuarios WHERE PENDINGRESETPASS LIKE ?",
                values : [emailToken]},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found token in DB --> Redirect to password reset
                        res.cookie("usrchpassToken", emailToken)
                        .redirect(`${process.env.URLFRONT}newPass`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        //The token cannot be found --> 
                        console.log("El token de cambio de contraseña no se ha encontrado en la BD");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//UPDATE PASSWORD (POST)
serverObj.post("/updatePass", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. En este momento no se puede hacer el cambio de contraseña. Inténtalo de nuevo más tarde.";
    //---VALIDATION OF NEW PASSWORD--//
    const validationResults = validateData(req.body);
    if (validationResults.ret !== true)
    {
        //Data validation fails --> Exit sending error information
        res.send(validationResults);
    }//if
    else
    {
        //Validation succeedes --> GO ON
        //--UPDATE THE PASSWORD FOR THE USER BASED ON TOKEN--//
        connectorDB("MySQL", connectionData)
		.then((connectionDB) => {
            try {
            //Created connection with DB --> GO ON
            //--HASH THE PASSWORD--//
            bcrypt.hash(req.body.password, 10)
            .then(hash => {
                //Password hashed OK --> Proceed to update it
                //--OPEN A TRANSACTION TO UPDATE IN DB--//
                connectionDB.beginTransaction(function(err) {
                    if (err)
                    {
                        //Transaction failed --> Exit and inform
                        throw err;
                    }//if
                    else
                    {
                        //--UPDATE THE TOKEN AND GET THE USER--//
                        connectionDB.query({
                            sql : "SELECT USRID FROM usuarios WHERE PENDINGRESETPASS LIKE ?",
                            values : [req.body.token]},
                            function (err, resultA) {
                                if (err)
                                {
                                    //Error in query --> rollback
                                    return connectionDB.rollback(function() {
                                        throw err;
                                    });
                                }//if
                                else if (resultA[0].USRID)
                                {
                                    connectionDB.query({
                                        sql : "UPDATE usuarios SET PENDINGRESETPASS = NULL WHERE USRID = ?",
                                        values : [resultA[0].USRID]}, 
                                        function (err, resultB) {
                                            if (err)
                                            {
                                                //Error in query --> rollback
                                                return connectionDB.rollback(function() {
                                                    throw err;
                                                });
                                            }//if
                                            else
                                            {
                                                //--UPDATE THE PASSWORD IN PROFILES TABLE--//
                                                connectionDB.query({
                                                    sql : `UPDATE perfiles SET PASS = ? WHERE EXT_USRID = ? AND PERFIL = 'registrado'`,
                                                    values : [hash, resultA[0].USRID]}, 
                                                    function (err, resultC) {
                                                        if (err)
                                                        {
                                                            //Error in query --> rollback
                                                            return connectionDB.rollback(function() {
                                                                throw err;
                                                            });
                                                        }//if
                                                        else
                                                        {
                                                            //--COMMIT TRANSACTION--//
                                                            connectionDB.commit(function(err) {
                                                                if (err)
                                                                {
                                                                    //Commit failed --> rollback
                                                                    return connectionDB.rollback(function() {
                                                                        throw err;
                                                                    });
                                                                }//if
                                                                else
                                                                {
                                                                    connectionDB.end();
                                                                    //Transaction committed
                                                                    //Password updated so inform
                                                                    res.send({"ret" : true, "caption" : `${process.env.URLBACK}login`});
                                                                }//else
                                                            });//commit
                                                        }//else
                                                    });
                                            }//else                                    
                                        });
                                }//else if
                                else
                                {
                                    //User not found
                                    connectionDB.end();
                                    console.log("Fallo al encontrar el usuario pendiente de cambio de contraseña",err);
                                    res.send({"ret" : false, "caption" : failMsg});
                                }//else
                            });
                    }//else
                });
            })
            .catch(fail => {
                connectionDB.end();
                //Password hash failed --> exit
                console.log("Fallo al encriptar la nueva contraseña",fail);
                res.send({"ret" : false, "caption" : failMsg});
            });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
        })
        //DB connection KO --> exit
		.catch((fail) => {
            //The connection with DB failed --> Exit sending error information
            console.log("Fallo de conexión con la BD",fail);
            res.send({"ret" : false, "caption" : failMsg});
		});
    }//else
});

//RETRIEVE DATA TO INITALIZE SEEKER (GET)
serverObj.get("/initSeekerData", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT DISTINCT PROVINCIA AS RES FROM alojamientos UNION SELECT DISTINCT COMUNIDAD AS RES FROM alojamientos;",
                values : []},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found token in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        console.log("No se han encontrado provincias ni comunidades autónomas en la BD");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//RETRIEVE BASIC CERTIFICATES DATA (GET)
serverObj.get("/getCertificatesBasics", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT CERTID, ETIQUETA, DESCRIPCION, WEBSITE, LOGO FROM certificados;",
                values : []},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found token in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        console.log("No se han encontrado datos de certificados en la BD");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//RETRIEVE LOCATIONS DATA (GET)
serverObj.get("/getLocations", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT ALID, NOMBRE, LATITUD, LONGITUD FROM alojamientos;",
                values : []},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found token in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        console.log("No se han encontrado datos de alojamientos en la BD");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//SEARCH ESTABLISHMENTS (POST)
serverObj.post("/startSearch", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. No se ha podido completar la búsqueda requerida";

    //--CONFIGURE THE SQL QUERY--//
    let strSQLinit = `  SELECT DISTINCT alojamientos.ALID, alojamientos.NOMBRE, certificados.CERTID, certificados.ETIQUETA, certificados.LOGO
                        FROM alojamientos
                            LEFT JOIN union_alojamientos_certificados
                                ON alojamientos.ALID = union_alojamientos_certificados.EXT_ALID
                            LEFT JOIN certificados
                                ON union_alojamientos_certificados.EXT_CERTID = certificados.CERTID
                            LEFT JOIN union_certificados_categorias
                                ON certificados.CERTID = union_certificados_categorias.EXT_CERTID
                            LEFT JOIN categorias
                                ON union_certificados_categorias.EXT_CATID = categorias.CATID
                        WHERE
                        (PROVINCIA LIKE ? OR COMUNIDAD LIKE ?)`;

    let hasCategories = req.body.filtros.reduce((acum, item) => {
        return acum || item;
    }, false);

    let strSQL;
    if (hasCategories)
    {
        strSQLinit += ` AND (`;
        strSQL = req.body.filtros.reduce((acum, item, index) => {
            if (item)
            {
                acum += `categorias.CATID = '${index + 1}' OR `; 
            }//if
            return acum;
        }, strSQLinit);
        strSQL = strSQL.substring(0, strSQL.length - 3);
        strSQL += `) ORDER BY alojamientos.NOMBRE;`;
    }//if
    else
    {
        strSQL = strSQLinit + ` ORDER BY alojamientos.NOMBRE;`;
    }//else

    //console.log(strSQL);

    //--RETRIEVE DATA BASED ON CURRENT REQUESTS--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        try {
        //Created connection with DB --> GO ON
        connectionDB.query({
            sql: strSQL,
            values: [req.body.provincia, req.body.comunidad]},
            function (err, results) {
                if (err)
                {
                    //Query failed
                    throw err;
                }//if
                else
                {
                    //The onboarding flag has been properly updated
                    connectionDB.end();
                    //Send results to front
                    res.send({"ret" : true, "data" : results});
                }//else
            });
        } catch(err){
            connectionDB.end();
            console.log("Fallo en sentencia SQL",err);
            res.send({"ret" : false, "caption" : failMsg});
        }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });

});

//RETRIEVE BASIC DATA FOR AN ESTABLISHMENT (GET)
serverObj.get("/getEstablishmentBasics/:alID", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT NOMBRE, DIRECCION, DESCRIPCION, PROVINCIA, LOGO FROM alojamientos WHERE ALID = ?;",
                values : [req.params.alID]},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found data in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {

                        connectionDB.end();
                        console.log("Datos no disponibles");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//RETRIEVE DETAILED DATA FOR AN ESTABLISHMENT (GET)
serverObj.get("/getEstablishmentDetails/:alID", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT * FROM alojamientos WHERE ALID = ?;",
                values : [req.params.alID]},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found data in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        console.log("Datos no disponibles");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//RETRIEVE CERTIFICATES FOR AN ESTABLISHMENT (GET)
serverObj.get("/getCertificates/:alID", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT CERTID, ETIQUETA, LOGO FROM union_alojamientos_certificados AS uac LEFT JOIN certificados AS c ON uac.EXT_CERTID = c.CERTID WHERE uac.EXT_ALID = ?;",
                values : [req.params.alID]},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found data in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        console.log("Datos no disponibles");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//RETRIEVE DATA FROM A CERTIFICATE ID (GET)
serverObj.get("/getCertificateData/:certID", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT ETIQUETA, LOGO FROM certificados WHERE CERTID = ?;",
                values : [req.params.certID]},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found data in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        console.log("Datos no disponibles");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//RETRIEVE ACTIVITIES (GET)
serverObj.get("/getActivities/:loc", (req, res) => {
    //Generic failure message
    const failMsg = "";
    
    //--CREATE A CONNECTION WITH DB--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        //Created connection with DB --> GO ON
        try {
            connectionDB.query({
                sql : "SELECT ACTID, NOMBRE, DESCRIPCION, DIRECCION, LOCALIDAD, IMAGEN, WEBSITE FROM actividades WHERE PROVINCIA LIKE ?;",
                values : [req.params.loc]},
                function (err, result) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else if (result.length)
                    {
                        connectionDB.end();
                        //Found data in DB
                        res.send({"ret" : true, "caption" : result});
                        //.redirect(`${process.env.URLFRONT}XX`);
                    }//else if
                    else
                    {
                        connectionDB.end();
                        console.log("Datos no disponibles");
                        res.send({"ret" : false, "caption" : failMsg});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : false, "caption" : failMsg});
            }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });
});

//SEARCH USERS FAVOURITES (POST)
serverObj.post("/getFavs", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. No se ha podido completar la búsqueda requerida";

    //--CONFIGURE THE SQL QUERY--//
    let strSQL = `  SELECT DISTINCT alojamientos.ALID,
                                    alojamientos.NOMBRE,
                                    certificados.CERTID,
                                    certificados.ETIQUETA,
                                    certificados.LOGO
                    FROM alojamientos
                            LEFT JOIN union_alojamientos_certificados ON alojamientos.ALID = union_alojamientos_certificados.EXT_ALID
                            LEFT JOIN certificados ON union_alojamientos_certificados.EXT_CERTID = certificados.CERTID
                    WHERE (alojamientos.ALID IN (   SELECT favoritos.EXT_ALID
                            	                    FROM favoritos
                           			                    LEFT JOIN usuarios ON usuarios.USRID = favoritos.EXT_USRID
                                                    WHERE usuarios.EMAIL = ?))
                    ORDER BY alojamientos.NOMBRE;`;

    //console.log(strSQL);

    //--RETRIEVE DATA BASED ON CURRENT REQUESTS--//
    connectorDB("MySQL", connectionData)
    .then((connectionDB) => {
        try {
        //Created connection with DB --> GO ON
        connectionDB.query({
            sql: strSQL,
            values: [req.body.user]},
            function (err, results) {
                if (err)
                {
                    //Query failed
                    throw err;
                }//if
                else
                {
                    //The onboarding flag has been properly updated
                    connectionDB.end();
                    //Send results to front
                    res.send({"ret" : true, "data" : results});
                }//else
            });
        } catch(err){
            connectionDB.end();
            console.log("Fallo en sentencia SQL",err);
            res.send({"ret" : false, "caption" : failMsg});
        }
    })
    //DB connection KO --> exit
    .catch((fail) => {
        //The connection with DB failed --> Exit sending error information
        console.log("Fallo de conexión con la BD",fail);
        res.send({"ret" : false, "caption" : failMsg});
    });

});

//CHECKOUT FAVOURITE STATE FOR ESTABLISHMENT AND USER (POST)
serverObj.post("/checkFavourite", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. No se ha podido completar la búsqueda requerida";

    //ENDPOINT PROTECTION
    let secured = JWT.checkJWT(req.body.JWT);
    //console.log(secured);
    if (!secured.ret)
    {
        //Endpoint secure failed
        res.send({"ret" : "error", "caption" : "error en acreditación de usuario!"});
    }//if
    else
    {
        //Endpoint secure succeeded
        //--CONFIGURE THE SQL QUERY--//
        let strSQL = `SELECT COUNT(favoritos.EXT_ALID) AS FAV FROM favoritos LEFT JOIN usuarios ON favoritos.EXT_USRID = usuarios.USRID WHERE usuarios.EMAIL LIKE ? AND favoritos.EXT_ALID = ?;`;

        //--RETRIEVE DATA BASED ON CURRENT REQUESTS--//
        connectorDB("MySQL", connectionData)
        .then((connectionDB) => {
            try {
            //Created connection with DB --> GO ON
            connectionDB.query({
                sql: strSQL,
                values: [secured.user, req.body.id]},
                function (err, results) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else
                    {
                        connectionDB.end();
                        //Send results to front
                        res.send({"ret" : results[0].FAV ? true : false, "caption" : ""});
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : "error", "caption" : failMsg});
            }
        })
        //DB connection KO --> exit
        .catch((fail) => {
            //The connection with DB failed --> Exit sending error information
            console.log("Fallo de conexión con la BD",fail);
            res.send({"ret" : "error", "caption" : failMsg});
        });
    }//else
});

//ADD TO FAVOURITES FOR USER (POST)
serverObj.post("/addFavourite", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. No se ha podido completar la búsqueda requerida";

    //ENDPOINT PROTECTION
    let secured = JWT.checkJWT(req.body.JWT);
    if (!secured.ret)
    {
        //Endpoint secure failed
        res.send({"ret" : "error", "caption" : "error en acreditación de usuario!"});
    }//if
    else
    {
        //Endpoint secure succeeded
        //RETRIEVE USER ID
        //--CONFIGURE THE SQL QUERY--//
        let strSQL = `SELECT USRID FROM usuarios WHERE EMAIL LIKE ?;`;
        connectorDB("MySQL", connectionData)
        .then((connectionDB) => {
            try {
            //Created connection with DB --> GO ON
            connectionDB.query({
                sql: strSQL,
                values: [secured.user]},
                function (err, userID) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else
                    {
                        strSQL = `INSERT INTO favoritos VALUES(?,?);`;
                        connectorDB("MySQL", connectionData)
                        .then((connectionDB) => {
                            //Created connection with DB --> GO ON
                            connectionDB.query({
                                sql: strSQL,
                                values: [userID[0].USRID, req.body.alID]},
                                function (err, results) {
                                    if (err)
                                    {
                                        //Query failed
                                        throw err;
                                    }//if
                                    else
                                    {
                                        connectionDB.end();
                                        //Send results to front
                                        res.send({"ret" : results.affectedRows ? true : false, "caption" : ""});
                                    }//else
                                });
                        });
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : "error", "caption" : failMsg});
            }
        })
        //DB connection KO --> exit
        .catch((fail) => {
            //The connection with DB failed --> Exit sending error information
            console.log("Fallo de conexión con la BD",fail);
            res.send({"ret" : "error", "caption" : failMsg});
        });
    }//else
});

//RETIRE FROM USER´S FAVOURITES (DELETE)
serverObj.delete("/eraseFavourite", (req, res) => {
    //Generic failure message
    const failMsg = "Lo sentimos. No se ha podido completar la búsqueda requerida";

    //ENDPOINT PROTECTION
    let secured = JWT.checkJWT(req.body.JWT);
    if (!secured.ret)
    {
        //Endpoint secure failed
        res.send({"ret" : "error", "caption" : "error en acreditación de usuario!"});
    }//if
    else
    {
        //Endpoint secure succeeded
        //RETRIEVE USER ID
        //--CONFIGURE THE SQL QUERY--//
        let strSQL = `SELECT USRID FROM usuarios WHERE EMAIL LIKE ?;`;
        connectorDB("MySQL", connectionData)
        .then((connectionDB) => {
            try {
            //Created connection with DB --> GO ON
            connectionDB.query({
                sql: strSQL,
                values: [secured.user]},
                function (err, userID) {
                    if (err)
                    {
                        //Query failed
                        throw err;
                    }//if
                    else
                    {
                        strSQL = `DELETE FROM favoritos WHERE EXT_ALID = ? AND EXT_USRID = ?;`;
                        connectorDB("MySQL", connectionData)
                        .then((connectionDB) => {
                            //Created connection with DB --> GO ON
                            connectionDB.query({
                                sql: strSQL,
                                values: [req.body.alID, userID[0].USRID]},
                                function (err, results) {
                                    if (err)
                                    {
                                        //Query failed
                                        throw err;
                                    }//if
                                    else
                                    {
                                        connectionDB.end();
                                        //Send results to front
                                        res.send({"ret" : results.affectedRows ? true : false, "caption" : ""});
                                    }//else
                                });
                        });
                    }//else
                });
            } catch(err){
                connectionDB.end();
                console.log("Fallo en sentencia SQL",err);
                res.send({"ret" : "error", "caption" : failMsg});
            }
        })
        //DB connection KO --> exit
        .catch((fail) => {
            //The connection with DB failed --> Exit sending error information
            console.log("Fallo de conexión con la BD",fail);
            res.send({"ret" : "error", "caption" : failMsg});
        });
    }//else
});
