-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-01-2021 a las 15:49:07
-- Versión del servidor: 8.0.22
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trust2traveldb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `ACTID` int NOT NULL COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 actividades',
  `NOMBRE` varchar(128) NOT NULL COMMENT 'Nombre de la actividad. Obligatorio',
  `LONGITUD` float DEFAULT NULL COMMENT 'Coordenada de longitud de la actividad',
  `LATITUD` float DEFAULT NULL COMMENT 'Coordenada de latitud de la actividad',
  `DIRECCION` varchar(255) DEFAULT NULL COMMENT 'Dirección de la actividad',
  `LOCALIDAD` varchar(128) DEFAULT NULL COMMENT 'Localidad de la actividad',
  `PROVINCIA` varchar(50) NOT NULL COMMENT 'Provincia de la actividad',
  `COMUNIDAD` varchar(50) NOT NULL COMMENT 'Comunidad de la actividad',
  `PAIS` varchar(50) DEFAULT NULL COMMENT 'País de la actividad',
  `TELEFONO` longtext COMMENT 'Teléfonos de contacto de la actividad',
  `WEBSITE` varchar(1024) DEFAULT NULL COMMENT 'Url del sitio web de la actividad',
  `EMAIL` varchar(512) DEFAULT NULL COMMENT 'Dirección de email de contacto de la actividad',
  `IMAGEN` varchar(1024) DEFAULT NULL COMMENT 'Url de la imagen de la actividad',
  `DESCRIPCION` text COMMENT 'Texto descriptivo de la actividad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena las actividades disponibles';

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`ACTID`, `NOMBRE`, `LONGITUD`, `LATITUD`, `DIRECCION`, `LOCALIDAD`, `PROVINCIA`, `COMUNIDAD`, `PAIS`, `TELEFONO`, `WEBSITE`, `EMAIL`, `IMAGEN`, `DESCRIPCION`) VALUES
(1, 'Xaloc Diving Center', 3.194, 42.0519, 'Calle Eivissa 1', 'L\'Estartit', 'Girona', 'Cataluña', 'España', '972 752 071', 'https://xalocdive.cat/', 'info@xalocdive.cat', 'https://xalocdive.cat/wp-content/uploads/2019/04/Precios-sub-xalocdivingcenter.jpg', '\r'),
(2, 'Turismo Activo Aventuras el Hornico', 11.048, 46.3145, 'Pantano de la bolera S/N', 'Pozo Alcón', 'Jaen', 'Andalucía', 'España', '', 'www.elhornico.com', 'informacion@elhornico.com', 'http://www.elhornico.com/img/sliderHomeTA.jpg', '\r'),
(3, 'SIERRA & SOL', -3.59787, 37.183, 'Placeta de Liñán, 5', 'Granada', 'Granada', 'Andalucía', 'España', '666 405 811', 'www.sierraysol.com', 'mtm@sierraysol.com', 'https://sierraysol.com/wp-content/uploads/2014/09/hiking-vacations-in-sierra-nevada-spain.jpg', '\r'),
(4, 'SDAD. COOP. AND. MARISMAS DEL ROCÍO', -6.48255, 37.1289, 'Pza Acebuchal, 22. ', 'El Rocío', 'Huelva', 'Andalucía', 'España', '959 430 432', 'https://www.donanavisitas.es/', 'info@donanavisitas.es', 'https://www.donanavisitas.es/wp-content/uploads/2019/05/marismas.jpg', '\r'),
(5, 'Quivirocio Deporte y Aventura', -4.38642, 38.0197, 'C/ Cañete de las Torres, 2', 'Montoro', 'Córdoba', 'Andalucía', 'España', '957 161 324', 'www.quivirocio.com', 'quivirocio@hotmail.com; info@quivirocio.com', 'http://www.quivirocio.com/wp-content/uploads/2020/07/deporte-y-aventura-quivirocio.jpg', '\r'),
(6, 'Platalea Educación Ambiental', -6.94927, 37.254, 'C/Pinta, 4', 'Huelva', 'Huelva', 'Andalucía', 'España', '959 260 708', 'www.platalea.com', 'info@platalea.com', 'https://www.platalea.com/wp-content/uploads/2020/06/platalea_2.jpg', '\r'),
(7, 'Parknatur Turismo Rural y Activo, SL', -4.49664, 36.6294, 'C/ Murillo Bracho, 3', 'Torremolinos', 'Malaga', 'Andalucía', 'España', '952 383 140', 'www.parknatur.com', 'joya@parknatur.com', 'http://www.parknatur.es/Rutas_para_grupos/imagenes_elementos/Los_Rondeles_3.jpg', '\r'),
(8, 'Museo de la Naturaleza Valle del Alberche', -4.65222, 40.4807, 'Urb. Los Chopos s/n', 'El Barraco', 'Ávila', 'Castilla y León', 'España', '667 659 107', 'https://museobarraco.wordpress.com/', 'museodelanaturaleza@elbarraco.org; bcastellano@hotmail.com', 'https://museobarraco.files.wordpress.com/2019/11/1.jpg?w=1036&h=1036&crop=1&zoom=2', '\r'),
(9, 'Multiaventura La Ragua', -3.01495, 37.0087, 'Calle  Pósito,  17', 'Laroles', 'Granada', 'Andalucía', 'España', '626 290 388', 'www.multiaventuralaragua.com', 'multiaventuralaragua@gmail.com', 'https://www.multiaventuralaragua.com/wp-content/uploads/2019/04/rappel.jpg', '\r'),
(10, 'Livetour Segway', 3.17552, 41.995, 'Cami del Vernegar S/N', 'Pals', 'Girona', 'Cataluña', 'España', '696 447 761', 'http://livetour.es/', 'info@livetour.cat', 'http://www.livetour.es/ca/assets/images/ruta-platja-1h-15-676x473.jpg', '\r'),
(11, 'Kensho sake', 0.69567, 40.8104, 'Barranc de Sant Pere, s/n', 'L\'Ampolla', 'Tarragona', 'Cataluña', 'España', '652 834 259', 'https://www.kenshosake.com/visita-kensho-y-delta-del-ebro/', 'info@kenshosake.com', 'http://www.kenshosake.com/wp-content/uploads/2019/07/62226505_2274283842783289_8191843823672978138_n-2.jpg', '\r'),
(12, 'Intramar', -8.75467, 42.5773, 'Rua Galufa 21', 'Villagarcía de Arousa', 'Pontevedra', 'Galicia', 'España', '986 742 072', 'www.intramar.org', 'chasula@intramar.org', 'http://www.intramar.org/images/fotoinicio/P4170131.JPG', '\r'),
(13, 'GUADIAMAREDUCA', -6.25684, 37.1314, 'Choza de los Pastores, 9', 'Aznalcázar', 'Sevilla', 'Andalucía', 'España', '675 438 975', 'https://guadiamareduca.com/', 'guadiamarea@gmail.com', 'https://guadiamareduca.com/wp-content/uploads/2017/08/piraguas-1-nic3b1os-escolares.jpg', '\r'),
(14, 'Granadaways', -3.5398, 37.1328, 'Calle Cuevas, 3', 'Monachil', 'Granada', 'Andalucía', 'España', '679 428 902', 'www.granadaways.com', 'info@granadaways.com', 'https://granadaways.com/wp-content/uploads/2019/10/IMG_destaca-chamana-1500x1027.jpg', '\r'),
(15, 'Flying Adventures services OLIVAIR', -2.95208, 38.2835, 'Complejo La Veguilla', 'Beas de Segura', 'Jaén', 'Andalucía', 'España', '953 496 362', 'www.olivair.es ', 'info@olivair.es', 'http://www.redeuroparc.org/flying-adventures-services-olivair#', '\r'),
(16, 'Eolis kite', 3.1958, 42.0496, 'c/ Cala Pedrosa 1-3 l\'Estartit.', 'L\'Estartit', 'Girona', 'Cataluña', 'España', '663 884 868', 'www.eoliskite.com', 'info@eoliskite.com', 'https://eoliskite.com/wp-content/uploads/2019/04/cursos-kite-eolis.jpg', '\r'),
(17, 'El Xiulet de Pals', 3.14649, 41.9721, 'Calle de la Font 3', 'Pals', 'Girona', 'Cataluña', 'España', '972 636 706', 'www.elxiuletdepals.com', 'info@elxiuletdepals.com', 'https://images.gestionaweb.cat/1309/pimg-1600-1600/camp-1282424.jpg', '\r'),
(18, 'El Rei del mar', 3.19607, 42.0497, 'Avenida de Grecia 5', 'L\'estartit', 'Girona', 'Cataluña', 'España', '972 751 392', 'www.elreidelmar.com', 'info@elreidelmar.com', 'http://www.redeuroparc.org/quims-diving-center#', '\r'),
(19, 'Ecodestinos', -3.60926, 39.0634, 'Calle Antonio López, 14', 'Daimiel', 'Ciudad Real', 'Castilla-La Mancha', 'España', '926 850 371', 'www.ecodestinos.es', 'info@ecodestinos.es', 'http://www.destinosmanchegos.com/content/images/visitaguiadatablasdedaimiel_acti_73_01_B.jpg', '\r'),
(20, 'Corriol, Serveis educatius', 2.47206, 42.1821, 'Carrer del Puig 7', 'Olot', 'Girona', 'Cataluña', 'España', '972 260 101', 'https://www.corriolserveis.com/', 'info@corriolserveis.com', 'https://www.corriolserveis.com/', '\r'),
(21, 'Contadero Aventuras', 11.048, 46.3145, 'Crta Beas a Cortijos Nuevos s/n', 'Cortijos Nuevos', 'Jaen', 'Andalucía', 'España', '', 'www.contadero.com', 'info@contadero.com', 'https://www.corriolserveis.com/wp-content/uploads/2013/11/visita-guiada-croscat_5.jpg', '\r'),
(22, 'Club Nàtic L\'Estartit', 3.20415, 42.0529, 'Puerto Deportivo', 'L\'Estartit', 'Girona', 'Cataluña', 'España', '972 751 402', 'www.cnestartit.com', 'info@cnestartit.com', 'https://www.cnestartit.com/wp-content/themes/cnestartit/img/gaudeix3.jpg', '\r'),
(23, 'Centro de Interpretación de los Olivares Tradicionales \"Solae\"', -6.07442, 40.4452, 'C/ Camino Nuevo, 15', 'Herguijuela de la Sierra', 'Salamanca', 'Castilla y León', 'España', '696 623 731', 'https://www.soleae.com/actividades-de-oleoturismo/', 'soleae@soleae.com', 'https://www.soleae.com/wp-content/uploads/2017/05/C.2.2-Visita-de-Campo-Oleoturimo-Soleae-2.jpg', '\r'),
(24, 'Centre Logistic de Bicicletes', 2.4802, 42.1751, 'Avda. de l\'estació 3', 'Olot', 'Girona', 'Cataluña', 'España', '972 692 023', 'https://bicicletes.atma.cat/', 'atma@atma.cat', 'https://bicicletes.atma.cat/wp-content/uploads/2015/08/78-.jpg', '\r'),
(25, 'Aventura Sport Xauen', -3.07045, 37.8424, 'Ctra de Huesa, 4', 'Quesada', 'Jaén', 'Andalucía', 'España', '953 714 218', 'www.aventurasport.es', 'info@aventurasport.es', 'http://www.aventurasport.es/wp-content/uploads/2020/07/DSCF2085-e1594116516873.jpg', '\r'),
(26, 'AQUAVENTU, SL', -1.96959, 40.6971, 'C/ La Fuente, 6', 'Taravilla', 'Guadalajara', 'Castilla-La Mancha', 'España', '949 830 193', 'www.aquaventur.com', 'contacto@aquaventur.com', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Falbarracinturismo.com%2Fitem%2Faquaventur%2F&psig=AOvVaw33NHoZpP9jEpg_m53NPI4Z&ust=1609673412076000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCZ1_GS_e0CFQAAAAAdAAAAABAD', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alojamientos`
--

CREATE TABLE `alojamientos` (
  `ALID` int NOT NULL COMMENT 'Clave primaria de la tabla. Acepta hasta 2^32 establecimientos',
  `NOMBRE` varchar(128) NOT NULL COMMENT 'Nombre del establecimiento. Obligatorio',
  `LONGITUD` float NOT NULL COMMENT 'Coordenada longitud del establecimiento. Obligatorio',
  `LATITUD` float NOT NULL COMMENT 'Coordenada latitud del establecimiento. Obligatorio',
  `DIRECCION` varchar(255) NOT NULL COMMENT 'Dirección del establecimiento. Obligatorio',
  `LOCALIDAD` varchar(128) DEFAULT NULL COMMENT 'Localidad o entorno de localización del establecimiento. Opcional',
  `PROVINCIA` varchar(50) DEFAULT NULL COMMENT 'Provincia del establecimiento. Opcional',
  `COMUNIDAD` varchar(50) DEFAULT NULL COMMENT 'Comunidad autónoma o región del establecimiento. Opcional',
  `PAIS` varchar(50) DEFAULT NULL COMMENT 'País del establecimiento. Opcional',
  `TELEFONO` longtext COMMENT 'Teléfonos de contacto del establecimiento en formato JSON. Opcional',
  `WEBSITE` varchar(255) DEFAULT NULL COMMENT 'Url del sitio web del establecimiento. Opcional',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT 'Dirección de email de contacto del establecimiento. Opcional',
  `LOGO` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Ruta al archivo del logo del establecimiento en el servidor. Opcional',
  `DESCRIPCION` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'Texto descriptivo del alojamiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los establecimientos localizados por la aplicación';

--
-- Volcado de datos para la tabla `alojamientos`
--

INSERT INTO `alojamientos` (`ALID`, `NOMBRE`, `LONGITUD`, `LATITUD`, `DIRECCION`, `LOCALIDAD`, `PROVINCIA`, `COMUNIDAD`, `PAIS`, `TELEFONO`, `WEBSITE`, `EMAIL`, `LOGO`, `DESCRIPCION`) VALUES
(100, 'Hotel Gran Rey', -17.3389, 28.089, 'Avda. Marítima 1, 38870 Valle Gran Rey, La Gomera', 'La Gomera', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 805 859', 'https://hotelgranrey.es/', '', 'https://www.biospheretourism.com/es/image/arxiu/0a6dbdf12e4a21417ddc6ab3e3bf2907.jpg?w=1140&h=392', 'El Hotel se localiza en la isla de La Gomera, concretamente en la costa del municipio de Valle Gran Rey, en el interior del Parque Rural de Valle Gran Rey, entorno del Parque Nacional de Garajonay, declarado por la UNESCO Patrimonio de la Humanidad. Tiene una ubicación ideal se encuentra en primera línea de playa, a 30 metros de la misma, puede llegar andando a restaurantes, bares, tiendas, diferentes playas y al puerto de Valle Gran Rey.'),
(101, 'Hotel Jardín Tecina', -17.1894, 28.0307, 'Lomada de Tecina, s/n, Playa de Santiago, La Gomera', 'La Gomera', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 245 101', 'https://www.jardin-tecina.com/es/', 'tecina@fredolsen.es', 'https://www.biospheretourism.com/es/image/arxiu/3703f0a5c3f8e1f9cb6637f9ba2b3681.jpg?w=1140&h=392', 'Alojarse en el Hotel Jardín Tecina es disfrutar de todas las ventajas que te ofrece un hotel de 4 estrellas. Ubicado en un entorno sin igual, en lo alto de un acantilado, rodeados de naturaleza, deporte, relax y ocio.'),
(102, 'Hotel Botánico The Oriental Spa Garden', -16.5381, 28.4111, 'Avenida Richard J Yeoward 1, 38400 Puerto de la Cruz', 'Puerto de la Cruz', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 381 512', 'https://hotelbotanico.com/', 'reservas@hotelbotanico.com', 'https://www.biospheretourism.com/es/image/arxiu/c2e800e110482136d707940bd93c5ea1.jpg?w=1140&h=392', 'El hotel debe su nombre al cercano y famoso Jardín Botánico del Valle de la Orotava. El trato amable, la excelencia en los servicios y la calidad de sus instalaciones hacen que el Hotel Botánico sea el más querido Hotel Gran Lujo en Islas Canarias.'),
(103, 'H10 Tenerife Playa', -16.5426, 28.4187, 'Av. de Colón, 12, Puerto de la Cruz, E-38400 · Tenerife', 'Puerto de la Cruz', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 900 444 466', 'https://www.h10hotels.com/es/hoteles-tenerife/h10-tenerife-playa', 'h10.tenerife.playa@h10hotels.com', 'https://cmspro.h10hotels.com/ImagenesHotel/hotel%20(3).jpg?RenditionID=16', 'Enfrente del mar y del Lago Martiánez, el H10 Tenerife Playa goza de una privilegiada ubicación en Puerto de la Cruz, al norte de Tenerife. El hotel cuenta con completas instalaciones entre las que destacan sus  amplias piscinas, una variada oferta gastronómica, dos salones de reuniones, un completo programa de animación, el Despacio Beauty Centre y el servicio Privilege, Exclusive Rooms and Services.'),
(104, '11 Holiday Homes Tenerife', -16.6046, 28.0263, 'C/ San Miguel s/n, Golf del Sur - 38369 - Tenerife', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 938 510', 'https://www.11holidayhomestenerife.com/cas/bienvenido', 'info@los11.es', 'https://www.biospheretourism.com/es/image/arxiu/6dedfb8c2ee50afc5d798bc692b0c1ec.jpg?w=280&h=211', 'Un complejo de once apartamentos turísticos en primera línea de mar situados en el sur de Tenerife, totalmente equipados para ofrecerte el mismo confort que tu propia casa.  Disfruta de nuestra hospitalidad, aprovecha todo lo que la isla tiene para ofrecerte y vive una experiencia en Tenerife única y completa, sintiéndote como un auténtico canario'),
(105, 'H10 Big Sur Boutique Hotel', -16.7127, 28.049, 'Av. Juan Carlos I, 28, Los Cristianos, E-38650 Tenerife', 'Los Cristianos', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 79 03 66', 'https://www.h10hotels.com/es/hoteles-tenerife/h10-big-sur', 'h10.big.sur@h10hotels.com', 'https://www.biospheretourism.com/es/image/arxiu/f34997ac181651048d6d7808f06dc1a8.jpg?w=1140&h=392', 'Emplazado frente al mar, en el tradicional pueblo de pescadores de Los Cristianos, el H10 Big Sur es un Hotel Boutique totalmente reformado y especializado en vacaciones para adultos. Cuenta con un interiorismo elegante de aire vintage y mediterráneo.'),
(106, 'H10 Conquistador', -16.7335, 28.0601, 'Av. Rafael Puig, 36 - E-38660, Tenerife', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 75 30 00', 'https://www.h10hotels.com/es/hoteles-tenerife/h10-conquistador', 'h10.conquistador@h10hotels.com', 'https://www.biospheretourism.com/es/image/arxiu/76b873403b27946819781b2aef2b71c4.jpg?w=1140&h=392', 'Este emblemático hotel situado frente al mar, en Playa de las Américas y con acceso directo al paseo marítimo, ha sido renovado con un Interiorismo luminoso y vanguardista.'),
(107, 'H10 Las Palmeras', -16.7317, 28.0658, 'Av. Rafael Puig Lluvina, 28 · Playa de las Américas · E-38660 · Tenerife', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 79 09 91', 'https://www.h10hotels.com/es/hoteles-tenerife/h10-las-palmeras', 'h10.las.palmeras@h10hotels.com', 'https://www.biospheretourism.com/es/image/arxiu/67908580203de0d9a78d848d4a884ac8.jpg?w=1140&h=392', 'Situado a 500m de las principales playas, junto al mar y con acceso directo al paseo marítimo, el H10 Las Palmeras está rodeado de amplios jardines subtropicales. El hotel cuenta con confortables habitaciones, restaurantes, bares, piscinas, pistas de tenis, Internet Corner y salón de reuniones, aparte de un completo programa de animación diurno y nocturno.'),
(108, 'H10 Gran Tinerfe', -16.7323, 28.0722, 'Av. Rafael Puig Lluvina 13, Costa Adeje, E-38660 Tenerife', 'Costa Adeje', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 791 200', 'https://www.h10hotels.com/es/hoteles-tenerife/h10-gran-tinerfe', 'h10.gran.tinerfe@h10hotels.com', 'https://www.biospheretourism.com/es/image/arxiu/7b37135b6509fb78882fce58ef273045.jpg?w=1140&h=392', 'Ubicado en primera línea de la conocida playa El Bobo, en Costa Adeje, ha sido completamente renovado con un diseño vanguardista y diáfano. Su restaurante principal cuenta con una amplia terraza donde disfrutar de comidas y cenas al aire libre.'),
(109, 'H10 Costa Adeje Palace', -16.7492, 28.0972, 'Playa La Enramada, La Caleta, Costa Adeje, E-38679 Tenerife', 'Costa Adeje', 'Santa Cruz de Tenerife', 'Canarias', 'España', '+34 922 714 171', 'https://www.h10hotels.com/es/hoteles-tenerife/h10-costa-adeje-palace?gclid=CPSYkq3XnscCFSTItAodds4Daw', 'h10.costa.adeje.palace@h10hotels.com', 'https://www.biospheretourism.com/es/image/arxiu/b25cc34287908e0e2bf38e8bc5fc8869.jpg?w=1140&h=392', 'El H10 Costa Adeje Palace es un hotel emblemático situado en primera línea de mar y con acceso directo a la playa de La Enramada. Este exclusivo hotel, rodeado de jardines tropicales, ofrece todo lo necesario para unas vacaciones inolvidables.'),
(110, 'H10 Estepona Palace', -5.15495, 36.4177, 'Av. del Carmen 99, E-29680-Estepona', 'Estepona', 'Málaga', 'Andalucía', 'España', '+34 952 79 00 40', 'https://www.h10hotels.com/es/hoteles-costa-del-sol/h10-estepona-palace', 'reservas.hes@h10hotels.com', 'https://cmspro.h10hotels.com/ImagenesHotel/11-3-17_Vista-general-piscina-hotel_0019hes.jpg?RenditionID=16', 'Situado en primera línea de playa, con acceso directo a la misma, el hotel H10 Estepona Palace integra a la perfección el estilo arquitectónico andaluz con un interiorismo actual, ofrece confortables habitaciones, terrazas con vistas al Mediterráneo, una amplia oferta gastronómica y un Despacio Spa Centre.'),
(111, 'H10 Andalucía Plaza', -4.96139, 36.4895, 'Urb. Nueva Andalucía s/n, E-29660-Marbella', 'Marbella', 'Málaga', 'Andalucía', 'España', '+34 952 81 20 00', 'https://www.h10hotels.com/es/hoteles-costa-del-sol/h10-andalucia-plaza', 'h10.andalucia.plaza@h10hotels.com', 'https://cmspro.h10hotels.com/ImagenesHotel/Fachada-de-dia0.jpg?RenditionID=16', 'Situado en Puerto Banús, en una de las zonas más exclusivas de Marbella, el H10 Andalucía Plaza es un hotel de estilo arquitectónico andaluz que ha sido renovado con un diseño vanguardista y actual. Recomendado para adultos, este emblemático hotel cuenta con habitaciones amplias y luminosas, una cuidada gastronomía, 8 salones de convenciones con capacidad total de hasta 1.000 personas y el renovado Despacio Spa Centre con una selecta carta de tratamientos. Disfrute de un ambiente tranquilo y relajado, ideal para unas vacaciones con amigos o en pareja en la Costa del Sol.'),
(112, 'APARTAMENTOS SEVILLA CENTRO', -5.99748, 37.3907, 'C. San Pablo, 4, 41001 Sevilla', 'Sevilla', 'Sevilla', 'Andalucía', 'España', '+34 661 701 709', 'http://apartamentosevillacentro.com/', 'gestion@apartamentosevillacentro.com', 'https://www.biospheretourism.com/es/image/arxiu/86bb3f8559bfc08b425e1220a4304467.png?w=1140&h=392', 'Los Apartamentos Turísticos Sevilla Centro están situados en edificios de reciente rehabilitación en la zona más privilegiada de Sevilla. Ofrecemos un alojamiento en Sevilla barato y de calidad a nuestros visitantes. Desde nuestros apartamentos turísticos podemos acceder directamente al patrimonio histórico de Sevilla, como la Catedral, los Reales Alcázares, el barrio de Santa Cruz y todo el centro, recién peatonalizado, donde podrá dar largos paseos y disfrutar de la gastronomía y ocio de la ciudad de Sevilla.'),
(113, 'KOBA HOSTEL', -1.97288, 43.3228, 'Karkizano Kalea, 5, 20002 Donostia, Gipuzkoa', 'Donostia', 'Gipuzkoa', 'País Vasco', 'España', '+34 943 165 817', 'http://www.kobahostel.com/', 'info@kobahostel.com', 'https://www.biospheretourism.com/es/image/arxiu/01006880dc56ced15f15c23abda35729.jpg?w=1140&h=392', 'Situado en el barrio Gros, el barrio de moda de San Sebastián, a 200m de la playa de la Zurriola, playa conocida por la calidad de sus olas y su ambiente surfero.'),
(114, 'LA SIESTA SALOU RESORT & CAMPING', 2.17555, 41.3766, 'La Siesta Salou, Resort & Camping, Carrer del Nord 37 - 43840 SALOU', 'Salou', 'Tarragona', 'Cataluña', 'España', '+34 977 380 852', 'https://www.camping-lasiesta.com/', 'info@lasiestasalou.com', 'https://www.biospheretourism.com/es/image/arxiu/07435d3b24ebdc22919aa27d25c4fb98.jpg?w=280&h=211', 'Con más de 50 años de historia, La Siesta Salou Resort & Camping es uno de los destinos de referencia para miles de turistas en la Costa Daurada. Su tranquilidad y su ambiente familiar hacen de este lugar un enclave idílico en el corazón de Salou; un auténtico oasis en calma para que las familias puedan disfrutar de unos días de relax y sobre todo felicidad :)'),
(115, 'MAS DE L\'ALEIX', 1.31949, 41.217, 'Celler Sui Generis SCCL, Mas de l\'Aleix s/n, 43886 Renau', 'Renau', 'Tarragona', 'Cataluña', 'España', '+34 670 265 764', 'https://www.celler-suigeneris.com/el-mas-de-l-aleix/', 'info@celler-suigeneris.com', 'https://www.biospheretourism.com/es/image/arxiu/9318402c91a1e6c30eff487e61216291.jpg?w=1140&h=392', 'Nuestra propiedad se extiende sobre 17 hectáreas de viñedos, oliveras y bosque, en las afueras de Renau, en medio de un espacio natural protegido. Consta de 3 casas independientes y totalmente equipadas, con una capacidad total de 16 personas y posibilidad de ampliación hasta 20. Cada casa dispone de su piscina propia. Zona de badminton, petanca y ping-pong en la finca.'),
(116, 'MASIA SPA CAN PASCOL CASA RURAL ECOLOGICA', 1.53, 41.4209, 'Masia Spa Can Pascol-Casa Ecológica, C/Masia Can Pascol 28, 08738 Pontons', 'Pontons', 'Barcelona', 'Cataluña', 'España', '+34 618 316 394', 'https://masiacanpascol.com/', 'info@masiacanpascol.com', 'https://www.biospheretourism.com/es/image/arxiu/d166983bfbcb507e417029cc9e175d09.JPG?w=1140&h=392', 'Casa Rural Ecológica de 150m2 en 2 plantas, para un mínimo de 1 persona y un máximo de 5, muy confortable y totalmente equipada, funciona con energía 100% verde. La casa está aislada entre viñedos y bosques a 70 Km de Barcelona y de Tarragona. Con 2 piscinas de agua salada: Una en la zona Spa en el interior de la casa y otra exterior de verano en el jardín.'),
(117, 'Andante Hotel', 2.17268, 41.3765, 'Av. Drassanes 23-25, 08001 Barcelona', 'Barcelona', 'Barcelona', 'Cataluña', 'España', '+34 902 222 103', 'https://www.andantehotel.com/es', 'reservas@andantehotel.com', 'https://www.biospheretourism.com/es/image/arxiu/bb74c4671d14e560517b279f2453dca2.jpg?w=1140&h=392', 'Andante Hotel, consciente de la importancia de mantener un desarrollo turístico responsable, asume un compromiso de forma voluntaria para orientar su actividad empresarial hacia un modelo de desarrollo sostenible. Nuestras instalaciones se han concebido para prevenir y minimizar los impactos negativos producidos por nuestra propia actividad; de igual manera están orientadas a conseguir una máxima eficiencia energética, con el objetivo de optimizar la sostenibilidad ambiental del hotel. Nuestros servicios potencian el desarrollo sostenible del territorio, en lo social, económico, cultural y ambiental.'),
(118, 'Hotel Pulitzer Barcelona', 2.16834, 41.3861, 'Calle Bergara 8, 08002 - Barcelona', 'Barcelona', 'Barcelona', 'Cataluña', 'España', '+34 934 816 767', 'https://www.hotelpulitzer.es/es/', 'bookings@hotelpulitzer.es', 'https://www.biospheretourism.com/es/image/arxiu/89d917ca184a57aadc4c3d7c6bddcc9e.jpg?w=1140&h=392', 'Pulitzer es un hotel boutique de diseño situado en pleno centro de Barcelona, a dos pasos de Plaza Catalunya. Su inmejorable ubicación es uno de sus principales atractivos, ya que está rodeado de la mejor oferta cultural, el shopping más exclusivo, los centros de negocios más importantes y donde confluye toda la red de transporte urbano.'),
(119, 'Twentytú Hi-Tech Hostel', 2.18796, 41.3992, 'Carrer de Pamplona  114, 08018 Barcelona', 'Barcelona', 'Barcelona', 'Cataluña', 'España', '+34 932 387 185', 'https://twentytu.com/es/tarifas-y-ofertas-grupo/', 'reservas@twentytu.com', 'https://www.biospheretourism.com/es/image/arxiu/08a40bee54209cb00e87b21f4db51e8a.jpg?w=1140&h=392', 'Un nuevo concepto de alojamiento urbano económico de nueva generación, Twentytú Hi-tech Hostel es el albergue más innovador y sostenible de la ciudad de Barcelona (la primera en el mundo en obtener el certificado BIOSPHERE RESPONSIBLE TOURISM).'),
(120, 'Hotel Golden Tulip Barcelona', 2.19062, 41.4006, 'CALLE AVILA, 135-139, 8018 BARCELONA', 'Barcelona', 'Barcelona', 'Cataluña', 'España', '+34 934 833 876', 'https://barcelona.goldentulip.com/', 'info@goldentulipbarcelona.com', 'https://www.biospheretourism.com/es/image/arxiu/a044112b523efbdcd80d8c76b6f02d8e.jpg?w=1140&h=392', 'El hotel Golden Tulip Barcelona se encuentra estratégicamente ubicado junto a la Avenida Diagonal, CCIB y al Centro Comerial Glòries, perfectamente conectado con las principales actividades empresariales y turísticas de la ciudad, por lo que es un hotel ideal tanto para turistas como para profesionales que requieren de alojamiento en Barcelona '),
(121, 'Hotel Barcelona 1882', 2.16929, 41.4039, 'Corsega, 482 Barcelona 08025', 'Barcelona', 'Barcelona', 'Cataluña', 'España', '+34 933 478 486', 'https://www.hotelbarcelona1882.com/', 'info@hotel1882.com', 'https://www.biospheretourism.com/es/image/arxiu/e1e143bac8e5dbb67711e6ecb06255ec.jpg?w=1140&h=392', 'El Hotel Barcelona 1882 abrió sus puertas el 14 de noviembre 2018 para convertirse en su espacio de lujo y relax junto a la Sagrada Familia. De elegancia deslumbrante, el Barcelona 1882 es un hotel sostenible, con certificación Leed Gold y premios en sostenibilidad hotelera y en buenas prácticas RSC, lo que asegura que, alojarse en él, es realizar Turismo Responsable.'),
(122, 'Hotel Ciutat de Girona', 2.62057, 41.9683, 'Carrer Nord 2, 17001 Girona', 'Girona', 'Girona', 'Cataluña', 'España', '+34 972 483 038', 'https://www.hotelciutatdegirona.com/es', 'info@hotelciutatdegirona.com', 'https://www.biospheretourism.com/es/image/arxiu/de804159b4a585c08b51017d0963d18f.jpg?w=1140&h=392', 'El Hotel Ciutat de Girona sabemos que las ciudades no solo hay que visitarlas, sino disfrutarlas. Por ello, le abrimos las puertas al centro histórico y cultural de Girona, donde tendrá a su disposición los mejores y más carismáticos comercios locales y establecimientos gastronómicos de proximidad.'),
(123, 'Alemanys 5', 2.82684, 41.9863, 'Carrer Alemanys 5, 17004 Girona', 'Girona', 'Girona', 'Cataluña', 'España', '+34 649 885 136', 'https://alemanys5.com/', 'mribera@alemanys5.com', 'https://www.biospheretourism.com/es/image/arxiu/8ce77aaac205c4514abd9af93467f831.jpg?w=1140&h=392', 'Ubicado dentro de la ciudad romana original, Alemanys 5 es una propiedad única cuyo edificio principal data del siglo XVI. Su restauración reciente integra lo antiguo y lo nuevo, con líneas sobrias y limpias que celebran elementos esenciales como el espacio, la luz, la sombra, el fuego, la piedra, el agua, la naturaleza y el silencio.'),
(124, 'Camping Begur', 3.20284, 41.9428, 'Ctra. d’Esclanyà Km.2, 17255 Begur', 'Begur', 'Girona', 'Cataluña', 'España', '+34 972 623 201', 'https://campingbegur.com/', 'info@campingbegur.com', 'https://www.biospheretourism.com/es/image/arxiu/3e16cbf7745d2578e48c571a573e1092.jpg?w=280&h=211', 'El Camping Begur es un cámping ubicado cerca de las mejores calas de la Costa Brava, recomendable por la tranquilidad reinante, por la concepción del espacio, por su pluralidad de actividades y como punto de ida y vuelta a Begur, pueblo mediterráneo, resguardado y lejos de la masificación turística, con siete pequeñas playas y un entorno privilegiado.'),
(125, 'H10 Blue Mar (Boutique Hotel)', 2.42399, 39.5354, 'Camí des Salinar 8, E-07160-Camp de Mar- Andratx', 'Mallorca', 'Baleares', 'Baleares', 'España', '+34 971 235 100', 'https://www.h10hotels.com/es/hoteles-mallorca/h10-blue-mar', 'h10.blue.mar@h10hotels.com', 'https://cmspro.h10hotels.com/ImagenesHotel/16-5-19_Vistas-generales-piscina-de-dia_0004.jpg?RenditionID=16', 'El H10 Blue Mar está situado en primera línea de mar de Camp de Mar, una de las mejores playas de Mallorca, y cuenta con numerosos servicios para relajarse en pareja o divertirse entre amigos. Este Hotel Boutique, especializado en vacaciones para adultos, ha sido recientemente renovado con un interiorismo elegante y contemporáneo con toques vintage. El hotel cuenta con espectaculares vistas al mar y espacios privados de ambiente tranquilo para que tu estancia sea inolvidable.'),
(126, 'H10 Casa del Mar', 2.4848, 39.5186, 'Gran Via del Puig Major 2, E-07180-Santa Ponça', 'Mallorca', 'Baleares', 'Baleares', 'España', '+34 971 693 366', 'https://www.h10hotels.com/es/hoteles-mallorca/h10-casa-del-mar', 'h10.casa.delmar@h10hotels.com', 'https://cmspro.h10hotels.com/ImagenesHotel/6-7-17_Vista-piscina-de-dia_0012 - retocada.jpg?RenditionID=16', 'Ubicado en primera línea de mar de la magnífica playa de Santa Ponça, el H10 Casa del Mar es un hotel de cuatro estrellas recientemente renovado que dispone de una completa gama de servicios. Entre sus principales atractivos destacan su amplia piscina y zona de hamacas, un restaurante, un Snack Bar y una terraza Chill-Out con infinity pool. El hotel cuenta también con un Despacio Spa Centre y un variado programa de animación para adultos y niños que lo hace ideal para disfrutar de unas agradables vacaciones en pareja o en familia.'),
(127, 'H10 Punta Negra (Boutique Hotel)', 2.55292, 39.5267, 'C/ Punta Negra 12, E-07181-Costa d\'en Blanes', 'Mallorca', 'Baleares', 'Baleares', 'España', '+34 971 680 762', 'https://www.h10hotels.com/es/hoteles-mallorca/h10-punta-negra', 'h10.puntanegra@h10hotels.com', 'https://cmspro.h10hotels.com/ImagenesHotel/hpn_261513509.jpg?RenditionID=16', 'Situado en la Costa d’en Blanes, en el sur de Mallorca, y con acceso directo a dos calas de aguas transparentes, el H10 Punta Negra es un exclusivo Hotel Boutique emplazado en una de las zonas más bellas de la isla. Sus habitaciones recientemente renovadas, su cuidada oferta gastronómica y su jardín rodeado de pinos lo convierten en un establecimiento emblemático de la isla. Asimismo, el hotel cuenta con 5 salones de reuniones con luz natural y un entorno único, junto al mar, idóneo para realizar cualquier tipo de evento.'),
(200, 'Abuela Benita', -4.4672, 40.4561, 'C/ Adolfo Suárez 3  ', '05260 Cebreros', 'Ávila', 'Castilla y León', 'España', '678 555 248', 'https://www.casaruralabuelabenita.es/', 'info@abuelabenita.es', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=FACHADA4945.125.jpg&c=2527', 'Abuela Benita consta de dos alojamientos independientes que comunican entre sí por las cocinas a través de un patio interior. Están ubicadas en el centro del pueblo de Cebreros y pensadas para estancias familiares y tranquilas. Cada una alberga cuatro habitaciones dobles distribuidas en dos plantas superiores.'),
(201, 'Agroturismo Arkaia', -2.63439, 42.8418, 'Arkaia, 13 C  ', '01193 Arkaia', 'Álava', 'País Vasco', 'España', '635 733 704', 'www.agroturismoarkaia.com', 'info@agroturismoarkaia.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=Agroturismo_Arkaia9.jpg&c=22244', 'Agroturismo Arkaia es fruto de una rehabilitación minuciosa y laboriosa del edificio original del siglo XIX que ha conservado la arquitectura tradicional, dando como resultado una casa rural de alquiler completo con capacidad para 5-9 personas, cómoda, moderna totalmente accesible, sostenible y comprometida con el medio ambiente.Dada su cercanía a Vitoria-Gasteiz (a 5 km. del centro histórico), permite aprovechar las numerosas propuestas de la capital de Euskadi, designada Capital Verde Europea 2012. Agroturismo Arkaia dispone de la Q de calidad turística y Ecoetiqueta'),
(202, 'Agroturismo El Mirador de la Cigüeña', -4.03248, 40.9762, 'C/ Cigüeña, 6 Bis  ', '40160 Cabanillas del Monte (Torrecaballeros)', 'Segovia', 'Castilla y León', 'España', '660 267 905', 'https://www.xn--elmiradordelacigea-30b2t.es/', 'info@elmiradordelacigüeña.es', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=IMG_20180621_1058207663.jpg&c=21490', 'PROYECTO FAMILIAR CON VALORES. CONOCER PARA CONSERVAR'),
(203, 'Agroturismo Maricruz', -1.37147, 42.9304, 'C/ San Andrés 23 ', '31438 Villanueva de Arce', 'Navarra', 'Navarra', 'España', '649 219 858', 'www.casaruralennavarra.com', 'ecoagroturismomaricruz@gmail.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=cabana_en_el_arbol62.jpg&c=540', 'Son tres casas rurales en dos modalidades. Casa rural Mari Cruz, es una casa rural por habitaciones, con baño compartido. Es la casa donde vivimos la familia. Una casa de madera y piedra, con diferentes espacios comunes. Tenemos otro edificio al lado donde hemos construido dos casas rurales enteras y espacios comunes para los viajeros rurales, como el comedor, cocina , sala de juegos y biblioteca. Todo ello calentado con biomasa por suelo radiante La casa rural Marcos I es una casa en modo dúplex pensada para una familia, donde los más pequeños duermen en un “árbol hueco”, con vistas a la granja y huerta. La casa rural Marcos II está pensada para una familia con niños o dos familias. También en modo dúplex. Nuestra ilusión es poder acercar el día a día de la granja ecológica a los viajeros que se acercan hasta nuestro hogar, así que todos los días hacemos visita a la granja con las familias y os avisamos de las labores por si queréis participar. Dependiendo de la estación ofrecemos diferentes talleres. También le damos gran importancia a la alimentación sana y ecológica, ofreciendo desayunos y cenas.'),
(204, 'Aldea do Portomartiño', -8.3716, 42.3915, ' Portomartiño  Xesta ', '36836 A Lama', 'Pontevedra', 'Galicia', 'España', '607869956', 'https://portomartinho.webnode.es/', 'info@portomartino.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=portomartino80051.jpg&c=28031', 'ALDEA DO PORTOMARTIÑO es la recuperación de una aldea deshabitada para actividades de  ecoturismo que nos permiten descubrir la naturaleza y el paisaje de la Serra do Suido y Cando, que forma parte de RED NATURA 2000. La aldea tiene una situación privilegiada, aislada y rodeada por el bosque de robles, abedules y acebos, en una zona forestal protegida y refugio de fauna. Ofrecemos alojamiento en 2 viviendas turísticas de alquiler completo con capacidad desde 2 hasta 11 personas. Desde la misma aldea se inician varias rutas de  senderismo y sendas naturales por el entorno de bosque de ribera y un paisaje húmedo de media montaña que destaca por su valor ecológico. En las cimas de la Sierra nacen varios ríos: Oitavén, Avia, Verduxo y Tea, que van formando numerosas cascadas y piscinas naturales de aguas cristalinas y fondo rocoso perfectas para el baño.'),
(205, 'Alojamiento Rural Viña y Rosales', -3.04285, 37.0045, 'C/ Iglesia, 14 ', '18494 Mairena', 'Granada', 'Andalucía', 'España', '958760177', 'https://www.alpujarras.alojamiento.raya.org/index_esp.htm', 'VyR@raya.org', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=vina_y_rosales85.jpg&c=497', 'La casa con techo rojo es quizás diferente, porque no es usual en esta parte de Las Alpujarras. A excepción de la iglesia, hay azoteas cubiertas con \"launa\", una arcilla gris-azulado, que \"cierra\" si está mojado y \"respira\" cuando está seco. La casa con techo rojo se denominó así durante muchos años, porque era visible a mucha distancia del pueblo de Mairena. Con una parra vieja y un árbol de rosas viejo también, la vivienda rural es llamada ahora Viña y Rosales. Un alojamiento andaluz notable, por razón de su arquitectura, su atmósfera agradable, y la riqueza de su historia. También porque el jardín tiene su propio pozo del agua fresquita de Sierra Nevada. Viña y Rosales es un alojamiento rural auténtico en el pueblo Mairena con 3 habitaciones con cuarto de baño. Si lo que buscais es tranquilidad, aire libre y mucha naturaleza, pasear el GR7 o errar por la Sierra Nevada, tenemos para vuestro bienestar un alojamiento excelente con carácter familiar.'),
(206, 'Alvarella Ecoturismo', -8.14888, 43.3744, ' Breanca nº 4  Doroña   ', '15615 Vilarmaior', 'Coruña', 'Galicia', 'España', '981 784 563', 'www.alvarella.com', 'info@alvarella.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=alvarella1029.jpg&c=5046', 'El albergue se ubica en una finca de 50.000 metros cuadrados. Consta de un edificio concebido para un turismo de grupos, con 12 habitaciones de 2-5 plazas, dos de ellas adaptadas para minusválidos, con baño y calefacción. Se sitúa a medio camino entre el bosque y el paisaje del valle, erguido sobre una meseta, y oculto bajo los árboles, jugando a ser un escondite y un observatorio de la naturaleza. El albergue no es sólo un alojamiento, es también un centro de aprendizaje y de iniciación a la cultura medioambiental, incorpora soluciones constructivas bioclimáticas y ecológicas , con aprovechamiento de la energía solar mediante una instalación solar.Ofertamos para grupos talleres y actividades de educación ambiental en relación al Parque Natural das Fragas do Eume, al Patrimonio Histórico Eumés, rutas de senderismo, las energías renovables, el litoral Atlántico y el reciclaje de residuos y aguas...'),
(207, 'Casa Mario', -6.6122, 43.0539, 'Posada de Rengos, 17  ', '33811 Cangas del Narcea', 'Asturias', 'Asturias', 'España', '985 911 198', 'www.casamario.net', 'info@casamario.net', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=Casa_Mario72.jpg&c=4162', ' Casa rural  situada al lado de la  Reserva Integral de Muniellos en el Parque Natural de las Fuentes del Narcea, Degaña e Ibias, en un  entorno privilegiado  dónde  podrás realizar  muchas actividades de ecoturismo cuando nos visites,  experiencias rurales en las que el descanso y la tranquilidad son compatibles con descubrir otra forma de vivir la naturaleza , respetuosa con el medio ambiente, con la cultura local, participando de nuestras tradiciones y costumbres . Te ofrecemos  una casa  de  alquiler compartido, con cuatro habitaciones y zonas comunes, cocina - comedor y salón con capacidad para ocho personas , o  si lo prefieres , la posibilidad de alquilar la casa íntegra. En su  rehabilitación  hemos conservado su estructura original utilizando los materiales propios de la zona, madera, piedra ....; en la zona exterior , el muro de piedra que la  rodea  acoge en en su interior la tradicional corrada, en la que conservamos el antiguo horno de pan y el hórreo centenario bajo el que podras pasar un rato  de descanso , leyendo o disfrutando de  la esencia de nuestra casa. Cada una de nuestras habitaciones invitan al descanso y nuestros deliciosos desayunos marcarán el inicio del día para que puedas   descubrir y practicar un senderismo sosegado y tranquilo; conocer nuestro entorno rural disfrutando de su peculiar etnografía, su cultura, sus costumbres y su gastronomí­a. A la medida de tus gustos, te facilitamos propuestas para caminar por las proximidades de Muniellos o por las diferentes rutas de la comarca de Fuentes del Narcea, descubriendo nuestra cultura del vino, la artesanía, las tradiciones... o nuestras especies más emblemáticas como el oso pardo. Te ofrecemos  experiencias vinculadas a la lana, al antiguo oficio de la tejeduría en telar o a la elaboración del pan, bajo petición y sin moverte de nuestra casa . La estancia mínima es de dos noches.'),
(208, 'Casa Rural Melones', -3.487, 40.8533, 'Avda. de Madrid, 109  ', '28189 Patones', 'Madrid', 'Madrid', 'España', '659 545 084', 'https://casaruralmelones.com', 'info@casaruralmelones.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=zonas_comun419422.jpg&c=29425', 'Teníamos un sueño, rehabilitar la antigua cuadra donde la familia Melones guardaba a sus animales y transformarla en una casa rural ecológica. Se ha hecho realidad y Casa rural Melones es un alojamiento con siete habitaciones, de los cuales una es adaptada a personas con discapacidad física. Tiene una zona interior de uso común con sala de estar con chimenea y biblioteca y un amplio comedor. También una zona exterior con barbacoa. Se puede alquilar por habitaciones con desayuno incluido o alquiler íntegro con capacidad para 14-18 personas. Además del alojamiento contamos con un taller de cerámica, una colección de cactus y crasas, gallinero y pequeño huerto de autoconsumo'),
(209, 'Casa rural Santa Barbara', -4.69053, 40.1367, 'Calle Juan de Dios Díaz, 67 ', '45640 El Real de San Vicente', 'Toledo', 'Castilla-La Mancha', 'España', '619292642', 'https://casaruralsantabarbara.es/', '', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=casa_189086.jpg&c=30939', 'Situados en la Sierra de San Vicente, en nuestra casa hemos tenido en cuenta el entorno en el que nos encontramos ofreciendo calidad y comodidad pero respetando la naturaleza (Natura 2000 y protección de aves) podéis disfrutar de la casa de alquiler completo con cuatro habitaciones dobles, dos baños, cocina totalmente equipada y un amplio patio con barbacoa y piscina de agua salada. '),
(210, 'Casas rurales Iris de Paz', -5.33104, 43.3341, '', '33583 Piloña', 'Asturias', 'Asturias', 'España', '682 076 475', 'www.casasruralesip.com', 'disfruta@casasruralesip.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=iris60.png&c=30905', 'Iris de Paz está vinculada con Asturias desde sus primeros pasos, hace ya más de 30 años. Entre otras actividades, y con el cariño al campo y a la belleza de la zona, nos hemos dedicado a rehabilitar casas antiguas de pueblos y aldeas. Lo hemos hecho con el mayor de los cuidados manteniendo el más puro estilo tradicional, para conservar todos los valores culturales y etnográficos de los valles en donde están las casas, favoreciendo así el desarrollo armónico de las aldeas asturianas de Piloña, cerca de Los picos de Europa.'),
(211, 'Ekolanda', -1.42142, 42.9361, 'Calle San Martín, 27 ', '31697 Esnotz', 'Navarra', 'Navarra', 'España', '682106417', 'https://ekolanda.com/', 'ekolanda@ekolanda.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=1_9643.50031.jpg&c=2527', 'Ekolanda es una antigua borda construida en el año 1842 convertida en una casa rural de cuatro habitaciones con encanto y un salón comedor con chimenea para disfrutar de unos días inolvidables y proporcionar descanso y un poco de paz a nuestro cuerpo y mente. Está totalmente rehabilitada y ha sabido mantener la esencia y la historia del Valle de Erro, uno de los grandes paraísos naturales de Navarra, para los amantes de la naturaleza, en él se pueden recorrer multitud de senderos que nos adentran en el Pirineo. Un lugar para descubrir y redescubrirse!!!  Te esperamos en Ekolanda... Veronica y Estefania.'),
(212, 'El Gran Sueño', -5.35193, 43.3812, 'Caspio la Vega ', '33534 Pintueles. Piloña', 'Asturias', 'Asturias', 'España', '985 710650', 'www.elgransueno.es', 'info@elgransueno.es', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=gran_sueno20004894.jpg&c=24783', 'El gran sueño es una casa rural con encanto en pleno campo asturiano. Sus cinco habitaciones tienen magníficas vistas de las montañas. Ha sido rehabilitada recientemente con acabados de calidad superior y con un estilo contemporáneo, para crear espacios actuales. Caminar por el campo contemplando la rica flora y fauna. Visitar las playas y villas marineras. Saborear la reputada gastronomía asturiana. Sentarse en el jardín y disfrutar de las fabulosas vistas. Leer un libro o tomar una copa en el porche o junto a la chimenea en invierno. Éstas son algunas de las razones por las que nuestros huéspedes han escogido el gran sueño para una escapada perfecta. Orgullosos de la sostenibilidad y del enfoque ecológico, además de criterios aplicados a las infraestructuras, para el desayuno se sirve zumo de naranja natural y fruta fresca de temporada, todo ello ecológico. Pan casero, bizcochos y galletas, también ecológicos, así como mermeladas ecológicas y queso asturiano.'),
(213, 'Hotel Meridional', -0.648774, 38.079, 'Av. de la Libertad, 64  ', '03140 Guardamar del Segura', 'Alicante', 'Valencia', 'España', '965 728 340', 'www.hotelmeridional.es', 'info@hotelmeridional.es', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=_DSC5489.15001598.jpg&c=23681', 'Disponemos de piscina-spa exterior, con zona infantil, zona de hidromasaje panorámica con vistas al mar, parking privado y de un prestigioso restaurante, \"El Jardín\", en el que degustar la auténtica cocina mediterránea, con terraza al aire libre y zona chill-out. El hotel también cuenta con varios salones para organizar todo tipo de eventos. Nuestras 52 habitaciones, modernas pero sin perder la calidez, se asoman al mar Mediterráneo desde amplias terrazas y disponen de todas las comodidades necesarias para hacer de su estancia una experiencia agradable. Todo rodeado de un entorno privilegiado.'),
(214, 'Hotel Mundaka', -2.69846, 43.4071, 'C/ Florentino Larrinaga, 9  ', '48360 Mundaka', 'Vizcaya', 'País Vasco', 'España', '946 876 700', 'www.hotelmundaka.com', 'info@hotelmundaka.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=mundaka4.jpg&c=23012', 'El Hotel Mundaka comenzó su actividad en 1995, rehabilitando un edificio del centro de Mundaka catalogado como edificio histórico, y desde entonces nuestra preocupación ha sido ir mejorando para ofrecerles la mejor estancia en nuestra villa, que es un paraíso para los que practican Surf y para las familias. Todos los que nos visitéis, tendréis la oportunidad de disfrutar de un hotel familiar, situado en el casco viejo de Mundaka, en el corazón de la Reserva de la Biosfera de Urdaibai y a pocos metros de la internacionalmente conocida \"ola de izquierda\", una de las mejores olas del mundo para la práctica del surf. El ambiente es acogedor y tranquilo, las habitaciones son cálidas y el trato procuramos que sea cercano y amable.Somos un hotel sostenible y por ello utilizamos productos ecológicos para la limpieza y reciclamos la práctica totalidad de los residuos del hotel, así como llevamos a cabo medidas de ahorro energético y de agua. Desde hace algún tiempo, disponemos de placas solares, que cubren nuestro consumo de agua caliente.En el entorno podréis disfrutar de actividades como la práctica del surf, buceo, paseos marítimos en barco o velero, paseos a caballo, Btt, senderismo, así como conocer la cultura, tradiciones y gastronomía del país vasco.En nuestro pequeño pueblo pesquero tendrán la oportunidad de visitar el mirador de Portuondo con una de las mejores panorámicas de la ría, la ermita de Santa Catalina, la isla de Izaro y a tan solo 11km, el biotopo protegido de San Juan de Gaztelugatxe.No se olviden de degustar alguno de los muchos pintxos que ofrecen los bares de la localidad, regados con un Txakoli de la comarca.'),
(215, 'Kaaño Etxea', -1.81102, 43.0305, 'Kaaño Etxea  ', '31866 Arrarats', 'Navarra', 'Navarra', 'España', '948 396 010', 'www.kaanoetxea.com', 'info@kaanoetxea.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=kaanoetxea8.jpg&c=539', 'Acogedora y sana casa diseñada y rehabilitada con criterios de bioclimática, Feng-Shui, bioconstrucción, geobiología. Autosuficiente con energías renovables. Tenemos 1 amplia habitación con chimenea. Según la temporada puedes recoger hongos y setas, castañas, nueces, moras, manzanilla, o bien ver ardillas, zorros, corzos, por el bosque y ovejas, vacas, cerdos y caballos. La casa está situada a 35 km. de Pamplona en el Valle de Basaburua, entre los Valles de la Ulzama y Larraun (Sierra de Aralar). La cocina de Alberta: tú eliges: tradicional, italiana o vegetariana. Dispone de 5 habitaciones con baño y hemos situado las camas en los lugares más sanos de la casa según la geobiología para un mejor descanso. En casa tenemos libros y documentación sobre plantas y flores, Feng-Shui, Bioconstrucción, Geobiología, Alimentación y Salud, Ecología y otros. Si fumas, serás invitad@ a fumar en el exterior. La casa se puede alquilar completa.'),
(216, 'La Casa del Naturalista', -5.4693, 43.5362, 'Argüerín 24 ', '33314 Argüeru', 'Asturias', 'Asturias', 'España', '985 999 004', 'www.casadelnaturalista.com', 'info@casadelnaturalista.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=1fachada3295.jpg&c=550', 'La Casa del Naturalista, en Argüeru, engloba un conjunto de actividades relacionadas entre si, que intentan generar un medio de vida. Estas actividades son la educación ambiental, la agricultura ecológica y el turismo rural.'),
(217, 'La Casina de Noriega', -4.57402, 43.3641, 'La Carrera, s/n.  ', 'Noriega', 'Asturias', 'Asturias', 'España', '676 538 245', 'https://www.casasdeandriz.com/', 'contacto@casasdeandriz.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=CasinaNoriega7753.jpg&c=24245', 'Noriega es un pueblo tranquilo situado al pie de las faldas del monte en el concejo más oriental de Asturias, Ribadedeva, cuya capital es el conocido pueblo de indianos de Colombres. La Casina de Noriega es una antigua casa tradicional de 75 m2 rehabilitada respetando tipología y materiales locales con pequeño jardín delante y mini huerto detrás. Por ello es imprescindible que tanto las personas afectadas como sus acompañantes se comprometan a no usar perfumes, inciensos, no usar detergentes en la lavadora que contengan olor, suavizantes, etc... Es decir, que respeten todo el protocolo de control ambiental para mantener la casina de Noriega como se pretende.'),
(218, 'La Posada de Caseres / Lo Niu', 0.251356, 41.0407, 'C/ Major, 10  ', '43787 Caseres', 'Tarragona', 'Cataluña', 'España', '977431861', 'https://www.laposadacaseres.com/', 'info@laposadacaseres.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=enoturismeterraalta9786.jpg&c=31895', 'TARRAGONA. Proyecto familiar de viticultores de la Terra Alta con diversificación con turismo rural. Dos casas rurales de agroturismo con la posibilidad de visita guíada de la explotación vitícola ecológica. Enamorados de la zona donde nacieron su propuesta turística pretende ser transmitir esos valores a los viajeros interesados por Terra Alta y Matarranya.  La explotación agraria , principalmente de viñedo, está inscrita en el CCPAE , consejo regulador de la agricultura ecológica. Colaboradores con otros productores locales y bodegas ecológicas de la zona, ofrecen visitas y catas de vino.'),
(219, 'La Posada del Valle', -5.19261, 43.4082, 'Collía ', '33549 Arriondas', 'Asturias', 'Asturias', 'España', '985841157', 'https://www.posadadelvalle.es', 'hotel@posadadelvalle.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=Hotel_Posada_del_Valle_-1224.jpg&c=514', 'Hotel Posada del Valle, Casona asturiana de piedra y madera, construida a finales del siglo XIX y rehabilitada con fidelidad arquitectónica. Su decoración se inspira en el equilibrio entre lo moderno y lo rústico. Nacho y Joann han logrado un confortable y acogedor establecimiento en el que se precian un característico salón con chimenea, una sala de lectura panorámica y terrazas con vistas al los Picos de Europa. El restaurante con amplias vistas, ofrece desayunos con panes recién hechos complementados con productos artesanales, y cenas a preaviso basadas en una cocina imaginativa y en la que se acentúa el uso de productos de la zona y ecológicos. El Hotel está rodeado por su propia finca de 80,000 m2 sobre la ladera sur de un pequeño valle junto al Paisaje Protegido del Sueve. Está situado en Collia a 2,5 Km de Arriondas. Los valores medio ambientales constituyen una parte central de su filosofía, contribuyendo así a crear un ambiente agradable, promoviendo el bienestar y el disfrute de huéspedes. En este sentido también se ruega no fumar dentro del hotel.'),
(220, 'Marem - casa rural sostenible', -2.69867, 42.1947, 'C/ Julio Castroviejo, 10  ', '26124 El Rasillo de Cameros L', 'Rioja', 'La Rioja', 'España', '699 169 816', 'www.casaruralmarem.com', 'hola@casaruralmarem.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=CASA-_RURAL-_MAREM_-_EL_RASILLO_565976.jpg&c=30871', 'La casa rural MAREM es una pequeña casa en el casco del municipio de El Rasillo que pretende dar alojamiento a personas, parejas, grupos de amigos y familias que quieran conocer la zona y llevar a cabo actividades en torno a la agroecología. Durante la estancia se propone una vivencia sostenible basada en el conocimiento de la zona, su patrimonio y su paisaje, el cuidado del agua, la gestión de los residuos y la minimización del consumo energético, el acercamiento a la agroecología y el cuidado de los recursos materiales y personales.  Tenemos varias posibilidades de alojamiento: alquilar habitaciones (opción alojamiento compartido) o bien la planta 1 y la planta 2 completas (opción alojamiento completo). Nosotras tenemos un espacio en la planta baja dedicado también a talleres y actividades y un jardín con huerta anexado a la casa.  '),
(221, 'Mirador de Babia', -6.07442, 42.9477, 'Riolago de Babia  ', '24144 Riolago de Babia', 'León', 'Castilla y León', 'España', '657 853 965', 'www.miradordebabia.com', 'maripazbecerravillamor@gmail.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=Jardin60070.jpg&c=30856', 'Las Casas Rurales Mirador de Babia se encuentran situadas en el histórico y monumental pueblo de Riolago de Babia, en el corazón de la comarca de Babia, León. El edificio es una casa típica babiana de principios siglo XX, rehabilitada con dedicación y aplicando criterios de bioconstrucción, hoy convertida en 2 alojamientos independientes: Mirador de Babia I y Mirador de Babia II. Ambos constituyen dos excelentes opciones para disfrutar del verdadero Turismo Rural en un entorno muy tranquilo. Desde nuestras casas se pueden realizar excursiones de senderismos y paseos en biclicetas de montaña, que son cedidas gratis a nuestros clientes'),
(222, 'Sabinares del Arlanza', -3.58536, 42.0428, 'C/ Las Turriendas 70 ', '09347 Puentedura.', 'Burgos', 'Castilla y León', 'España', '947 616 908', 'www.sabinaresdelarlanza.com', 'info@sabinaresdelarlanza.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=12196252_904666452915943_68537316567.jpg&c=18489', 'Hotel Rural bioclimático y sostenible, ubicado en Puentedura, junto al río Arlanza, a medio camino entre Lerma y Covarrubias, en la provincia de Burgos. Es un espacio innovador que amplía la oferta turística de la comunidad de Castilla y León. Os invitamos a practicar agroturismo conociendo nuestro proyecto y sus peculiaridades y el ecoturismo, ese turismo orientado a la naturaleza disfrutando del espectacular entorno que nos ofrece el parque natural de \"La Yecla y los Sabinares del Arlanza\".'),
(223, 'Sele - Casa d\'Aldea', -5.3224, 43.394, 'Samartín, s/n ', '33583 Borines. Piloña', 'Asturias', 'Asturias', 'España', '985707587', 'www.sele.com.es', 'info@sele.com.es', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=Casa_Sele_entrada_(1)2153.jpg&c=20107', 'La nuestra es una Casa d\"Aldea de alquiler compartido (bed&breakfast) con más de cien años de antigüedad. En su restauración integral hemos puesto al día esta casa tradicional asturiana, potenciando la propia cultura atlántica para disfrute de nuestros huéspedes. Os invitamos a descansar con nosotros y a tomaros un respiro en medio de la campiña asturiana, con nuestra propuesta de ocio culto y activo. De entre las posibles traducciones que podríamos escoger para intentar incorporar todos los matices de la expresión inglesa “country life” a nuestra lengua, quizá sea “vida de país” la más adecuada de todas. Country Life no significa sólo vida rural, es algo más. Es muncho más. Somos munchos los que prácticamente nacimos con la crisis económica, social y cultural que se ceba con nuestra Asturias desde el último cuarto del siglo XX, sin tener aún muy claro a dónde nos está encaminando la miserable dinámica clientelar articulada entorno a la misma, generadora de un lamentable escenario que a muchos nos parece por completo estéril. Dende este rincón, queremos haceros partícipes de nuestra propia aventura y deseamos mostraros cómo munchos conciudadanos nuestros, eligen día tras día, de forma callada y modesta, enfrentar los profundos cambios sociales y económicos vinculados a esa crisis desde una perspectiva por completo nueva. Queremos mostraros en la medida de lo posible esa nueva “vida de país” que surge en Asturias –al igual que en otros muchos otros lugares- en estos tiempos inciertos, encarándolos con imaginación y valentía. estos tiempos inciertos, encarándolos con imaginación y valentía. Una vida rica en valores culturales y humanos, abierta al mundo y vinculada decididamente con nuestro excepcional medio natural. Una vida alejada del estándar urbano y uniformizador que impone el sistema. Una vida moderna que se afirma y evoluciona desde las formas tradicionales de la vida rural, apoyándose en la esencia de la memoria de un pueblo que fue y que aún no quiere dejar de ser.Os invitamos a vivir con nosotros, y de otra forma, el presente y futuro de este país de nombre plural, único y también mágico: Asturias. Afayáivos, esti ye’l vuestru llar.'),
(224, 'Turismo Rural La Ojinegra', -0.529734, 40.9691, 'C/ La Iglesia nº 21  ', '44509 Alloza', 'Teruel', 'Aragón', 'España', '696816138', 'laojinegra.com', 'info@laojinegra.com', 'https://www.ecotur.es/v_portal/inc/imagen.asp?f=Restaurante-km08964.jpg&c=15818', 'Turismo rural La Ojinegra, es una casa rural de categoría superior que dispone de tres amplias habitaciones dobles. Destaca además por su restaurante ecológico El Morral de La Ojinegra, con su cocina a fuego de leña, platos con ingredientes ecológicos certificados, de proximidad y de comercio justo y con la mención \"restaurante Km0\" de Slow Food por lo que adquiere un compromiso para fomentar la biodiversidad y promover la cultura alimentaria.'),
(300, 'Inter Continetal Madrid', -3.69229, 40.4362, 'Paseo de la Castellana, 49,\n Madrid, 28046, Spain', 'Madrid', 'Madrid', 'Madrid', 'España', '', 'InterContinental Madrid', '', 'https://www.thesloaney.com/wp-content/uploads/2016/11/Madrid3.jpg', 'Con 66 años de historia le descubrimos todos los secretos de la capital española en el enclave único del Paseo de la Castellana. Conozca un referente de la hotelería española con los estándares de la prestigiosa marca internacional InterContinental Hotels & Resorts. Por sus 302 habitaciones, 16 salas para eventos, el exclusivo Club InterContinental y el Restaurante El Jardín seremos su residencia favorita en Madrid.'),
(301, 'Mas Salagros EcoResort', 2.27755, 41.5315, 'Riera de Vallromanes, s/n\nVallromanes, 08188', 'Vallromanes', 'Barcelona', 'Cataluña', 'España', '93 565 60 65', 'Mas Salagros EcoResort', 'recepcion@massalagros.com\n', 'https://www.bing.com/images/search?view=detailV2&ccid=R%2bLD2Uxh&id=AEFF0DDB8BCEB42912D65496E0E16D637219FB62&thid=OIP.R-LD2UxhWjL8p3mPfLfTFgHaES&mediaurl=https%3a%2f%2fwww.cellophaneland.com%2fwp-content%2fuploads%2f2017%2f04%2fhotel-mas-salagros-ecoresort-aire-ancient-baths-sportrooms-viajar-deporte-alojamiento-portada-1280x720s-1.jpg&exph=684&expw=1183&q=m%c3%a1s+salagros+ecoresort&simid=608048648188857082&ck=63902756CB0992AE3BAFA9A136F12403&selectedIndex=3&FORM=IRPRST', 'Somos un hotel 100% ecológico. En Mas Salagros cumplimos con los estándares establecidos en la normativa europea sobre sostenibilidad, que incluyen materiales de construcción, eficiencia energética y gestión de residuos. En Mas Salagros, encontrarás de todo, desde eco-amenities hasta ingredientes locales de temporada en el restaurante.');
INSERT INTO `alojamientos` (`ALID`, `NOMBRE`, `LONGITUD`, `LATITUD`, `DIRECCION`, `LOCALIDAD`, `PROVINCIA`, `COMUNIDAD`, `PAIS`, `TELEFONO`, `WEBSITE`, `EMAIL`, `LOGO`, `DESCRIPCION`) VALUES
(302, 'Villa Magna Hotel ', -3.68821, 40.43, 'Paseo de la Castellana 22\n28046 Madrid, España', 'Madrid', 'Madrid', 'Madrid', 'España', '91 587 1234', 'Villa Magna Hotel', 'villamagna@villamagna.es', 'https://www.bing.com/images/search?view=detailV2&ccid=cJ%2fnr4U0&id=4735BF895995D3A674F8C41F85772FF90EE41426&thid=OIP.cJ_nr4U0vj7DSAb-DPxM_QHaFA&mediaurl=https%3a%2f%2fmedia-cdn.tripadvisor.com%2fmedia%2fphoto-s%2f08%2f1e%2fb9%2fd7%2fhotel-villa-magna.jpg&exph=372&expw=550&q=villa+magna+madrid&simid=608031386677740433&ck=33954EEF0F1373B99429C387905CE356&selectedIndex=1&FORM=IRPRST', 'Con delicada elegancia, Villa Magna es el hotel más distinguido del corazón de Madrid.Su privilegiada ubicación, cerca de museos de renombre, de los restaurantes más novedosos y junto a una vibrante vida nocturna, además de encontrarse en el mejor distrito comercial de la ciudad, Villa Magna captura la vivacidad de la cultura española y la calidez de la hospitalidad europea. El hotel perfecto para explorar la majestuosa capital de España.\n¡Disfrute de una experiencia Villa Magna !'),
(400, 'Ulle Gorri', -2.94448, 42.9732, 'Apregindana Lekua , San Lorenzo 2', '01449 Untza- Apregindana', 'Álava', 'País Vasco', 'España', '+34 647 712 806', 'https://ullegorri.com/', 'contact@ullegorri.com', 'https://ullegorri.com/wp-content/uploads/2020/06/ULLE-GORRI_WEB_001-scaled-1.jpg', 'Ulle Gorri Baserria is an old basque farmhouse, located in a privileged environment in the Basque Mountains. It´s surrounded by a beautiful sea of ​​green meadows throughout the year, in the foothills of the mythical Gorbeia Mountain, near the beech forest of Altube and the Gujuli waterfall and it´s also the closest accommodation, only a short walking distance, to the Salto del Nervión, the highest waterfall in Spain. There are innumerable activities to do during your stay with us. Great location: less than 20 minutes from Vitoria, 40 minutes from Bilbao and La Rioja and only an hour and 15 minutes from Donosti (San Sebastián) or Pamplona and with easy access just 10 minutes away from the motorway exit.1. Etxea Rural House from 6 to 12 persons - «Etxea», which means house in Euskera, has been specifically restored recovering old original materials, to give the home a unique personality that seduces our guests. The restored antique furniture, the magnificent doors and the precious earthen pottery, which belonged to an ancient palace in the area, make Etxea at Ulle Gorri a very special place to rest and enjoy.'),
(401, 'La Posada de San Marcos, Millán Arkwright SL', -6.66455, 37.8732, 'Calle Colon 12', '21340 Alajar', 'Huelva', 'Andalucía', 'España', '+34 959 125 712', 'http://www.sanmarcosalajar.com', 'info@posadasalajar.com', 'https://sanmarcosalajar.com/wp-content/uploads/2017/09/san-marcos-alajar-rural-hotel-andalucia-garden-2.jpg', 'Our carbon footprint becomes more important everyday which is why we decided to create a low impact, environmentally friendly hotel. By staying at La Posada de San Marcos you too will be helping preserve the environment and be able to enjoy the sensation created by energy efficient, carbon neutral accommodation while maintaining an excellent standard of quality. We have created a low impact environmentally friendly building using as much of the original material while introducing modern day elements. The stone in the perimeter walls is from the old house as is the sand used to mix the mortar; the roof tiles were carefully removed and have been reused to ensure the building blends in with the rest of the village when seen from the Peña. We also managed to save enough to use them as wall light in the public areas of the house. All the old chestnut beams and the original front door were renovated by our local carpenters and we actually made a small wardrobe in one of the bedrooms using one of the old doors from the original house. The majority of the furniture used is antique and many an hour was put into restoring it – each room is decorated in a different and rather eclectic way! Lots of the old bottles we are using for decoration were found in the house and as time goes by we continue to decorate the house with items usually found up in somebody’s attic!'),
(402, 'TAKE HOSTEL CONIL', -6.0874, 36.2734, 'Calle Almadraba N9 Locales 9', '11140 Conil De La Frontera', 'Cádiz', 'Andalucía', 'España', '+34 605 462 884', 'http://WWW.TAKEHOSTELCONIL.COM', 'reservas@takehostelconil.com', 'https://takehostelconil.com/wp-content/uploads/2019/07/DSC5028jpg_1920x1080.jpg', 'NO somos un HOSTEL, NO somos un HOTEL, “SOMOS LA COMBINACIÓN PERFECTA DE AMBOS” En TAKE Hostel hemos creado el lugar perfecto para descansar, disfrutar del mar, de la buena comida y de los deportes acuáticos como el Surf, Kitesurf y Windsurf. Situado en el centro de Conil de la Frontera y a 100 metros de la playa, TAKE Hostel es el sitio perfecto para tus vacaciones. Nuestro hostel ofrece escuela de Surf , alquiler de material , Paddel Surf , fatbikes , Yoga y clases de Kitesurf . Disponemos de una escuela de Surf y beach club en la Playa de El Palmar , ofreciendo un transporte gratuito entre el hostel y nuestras instalaciones en El Palmar .'),
(403, 'TECNIBER, SA', 1.99393, 42.0526, 'C/ Rasa Dels Molins 24', '08600 Berga', 'Barcelona', 'Cataluña', 'España', '+34 938 220 634', 'http://www.mateus.cat', 'ruralmateus@gmail.com', 'http://www.mateus.cat/new/wp-content/uploads/porxo-de-mateus.jpg', 'El Porxo es una antigua masía restaurada con mucho gusto que puede acoger cómodamente de 11 a 15 personas. Dispone de una sola planta de fácil acceso, lo que la hace adecuada para personas con movilidad reducida. Tiene una magnífica sala de estar con chimenea, una cocina totalmente equipada, una acogedora sala recreativa y un elegante patio con barbacoa para gozar de una experiencia inolvidable.'),
(404, 'AGROTURISMO ABAIENEA', -2.75382, 42.8276, 'Calle Erea 4', '01195 Vitoria-Gasteiz', 'Álava', 'País Vasco', 'España', '+34 656 758 673', 'http://abaienea.es', 'info@abaienea.es', 'https://images.squarespace-cdn.com/content/v1/5faa776c4824a917c7df6f06/1605098437273-080XR6O9ODLKDO77TF8N/ke17ZwdGBToddI8pDm48kGoM3yVBFkFBakuD9s-3Qsp7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0oycmklwMHPwSb2Cr-KYzbpYgr4-WzDn12GiDVULE_sk_7yMcy5g1F7X83zvWKZcUw/ABAIENEA+02.jpg?format=1500w', '2 RURAL APARTMENTS IN ARIÑEZ, Vitoria-Gasteiz, EUSKADI ( BASQUE COUNTRY).'),
(405, 'Agroturismo Bisalde', -2.80377, 43.4194, 'Barrio Zubiaurrealde 39-A', '48130 Bakio', 'Vizcaya', 'País Vasco', 'España', '+34 639 212 355', 'http://www.facebook.com/BISALDEAGROTURISMO/', '', 'https://www.planrural.com/imagenesbd/69295664_b.jpg', 'El Caserío Bisalde es una acogedora casa de campo de piedra ubicada en un pequeño barrio de la localidad costera de Bakio. Con excelentes vistas al mar y rodeada de bosque autóctono'),
(406, 'Agroturismo Madarian', -2.41088, 43.2312, 'Barrio Aretxalde 88 B', '48196 Lezama', 'Vizcaya', 'País Vasco', 'España', '+34 944 554 427', 'http://www.madarian.com', 'madarian.agroturismo@gmail.com', 'http://www.madarian.com/irudiak/Zaldi-etxe.png', '6 rooms and common services'),
(407, 'Apartamentos Rurales Casa Lafuente', -2.8582, 42.9314, 'San Roque 3', '01139 Lukiano', 'Álava', 'País Vasco', 'España', '+34 679 080 440', 'http://www.casalafuente.com', 'info@casalafuente.com', 'https://static.wixstatic.com/media/b48834_016657676ad349d2a66e455be327a7d3~mv2.jpg/v1/fill/w_960,h_640,al_c,q_85,usm_0.66_1.00_0.01/b48834_016657676ad349d2a66e455be327a7d3~mv2.webp', 'Casa Lafuente is the result of refurbishing old hay houses and stables attached to the typical farming country house found in this area, transformed into a rural house which is divided into two apartments and an information center to welcome and help visitors enjoy the surrounding landscape and the customs and traditions of its past and present inhabitants. It is a tribute to a family legacy which holds in its interior those tools and necessities that one day helped its inhabitants to build, protect and preserve these surroundings which delight our senses today. El Sobrao rural apartment, rural home with capacity for 6-7 people Our rural house Casa Lafuente with capacity for 15 people Morada y Enseres rural apartment, a two floor rural home with capacity for 4-5 people Rural apartment Aperos de Labranza, rural home with capacity for 4-6 people. Rural loft Cuarto del Telar, rural home with capacity for two people. Rural Loft El Horno, capacity for 2-4 people.'),
(408, 'Arrizurieta', -2.77088, 43.3932, 'Mañu Auzoa 43', '48370 Bermeo', 'Vizcaya', 'País Vasco', 'España', '+34 607 482 700', 'http://www.arrizurieta.es', 'info@arrizurieta.es', 'https://www.arrizurieta.eus/wp-content/themes/arrizurieta/img/fotos-despues/4.jpg', 'Set in the countryside, 10 minutes’ drive from Bermeo, Arrizurieta features charming, rustic-style rooms with free WiFi. It has a shared lounge and furnished terrace. It has been awarded the European Ecolabel, as well as the Spanish Energy Performance Certificate. All of 6 rooms have a private bathroom with free toiletries. The shared lounge has a TV. Guests can make use of the shared kitchen equipped with an oven, microwave and dishwasher for an extra cost. This property has also 1 apartmen available with capacity up to 6 people. There are many hiking routes in the surrounding area. Staff at Arrizurieta can provide tourist information ( Gaztelugatxe, Mundaka, Urdaibai...). Bilbao and its airport can be reached in 30 minutes’ drive.'),
(409, 'Casa Rural Errotabarri', -2.82432, 43.3804, 'Zumetzaga Bidea 6', '48120 Mungia', 'Vizcaya', 'País Vasco', 'España', '946150143', 'http://www.errota-barri.com', 'info@errota-barri.com', 'https://errota-barri.com/wp-content/uploads/Exteriores_ErrotaBarri_Alta_00041.jpg', '7 rooms'),
(410, 'Casa Rural Etxegorri', -2.84427, 43.0881, 'Barrio Urigoiti 10', '48410 Orozko', 'Vizcaya', 'País Vasco', 'España', '682 672 431', 'http://www.casaruraletxegorri.com', 'info@casaruraletxegorri.com', 'https://static.wixstatic.com/media/13ae87_11997e1862164c9392a78d0120b505c3~mv2.jpg/v1/fill/w_1897,h_709,al_c,q_85/13ae87_11997e1862164c9392a78d0120b505c3~mv2.webp', '6 rooms hotel'),
(411, 'Zadorra Etxea', -2.39218, 42.854, 'Zadorra Kalea 21', '01200 Agurain', 'Álava', 'País Vasco', 'España', '945 31 24 27', 'http://www.zadorraetxea.com', 'info@zadorraetxea.com', 'http://www.zadorraetxea.com/images/h_g2.jpg', '6 habitaciones y cocina'),
(412, 'DOLAREA', -2.20813, 43.048, 'Avenida Navarra 57', '20200 Beasain', 'Gipuzkoa', 'País Vasco', 'España', '943 889 888', 'https://www.hoteldolarea.com/', 'info@dolareahotela.com', 'https://www.hoteldolarea.com/muestras/2016/03/209-vistas.jpg', 'HOTEL DE 4 ESTRELLAS. Servicios: restaurante, cafetería, salas de reuniones, parking privado.'),
(413, 'Hotel Amalurra', -3.22042, 43.2354, 'Barrio La Reneja 35', '48879 Artzentales', 'Vizcaya', 'País Vasco', 'España', '946109540', 'http://www.amalurra.com', 'amalurra@amalurra.com', 'https://amalurra.com/wp-content/uploads/2018/11/Amalurra-8639-copy-1600x900.jpg', 'Servicio de alojamiento turístico, que cuenta con hotel, salas multifuncionales, restaurante, spa, y servicios de tratamiento de belleza, eventos, salas de congresos, piscina y más de 10 hectáreas llenas de esquinas donde poder disfrutas de la naturaleza y actividades al aire libre.'),
(414, 'HOTEL APARTAMENTO RURAL ATXURRA', -2.76016, 43.3892, 'Barrio Arronategi S/N', '48370 Bermeo', 'Vizcaya', 'País Vasco', 'España', '944654404', 'http://www.hotelatxurra.com', 'info@hotelatxurra.com', 'https://www.hotelatxurra.com/wp-content/uploads/2016/01/el-hotel-rural-atxurra.jpg', 'Atxurra Country Hotel-Apartment is a hotel in Urdaibai Reserve in Bermeo (Bizkaia) very close to Bilbao and its airport and it has 12 spacious rooms and 4 fully equipped apartments.'),
(415, 'Hotel Imaz', -2.25351, 43.0084, 'Kale Nagusia 27', '20214  Segura', 'Gipuzkoa', 'País Vasco', 'España', '943 80 10 25', 'http://www.hotelimaz.com', '', 'http://www.hotelimaz.com/img/lightslider-img/01.jpg', 'Family hotel opened in 2016 and located in the centre of Segura (Gipuzkoa). Fully automated, efficient and sustainable. 9 rooms with all amenities and a restaurant bar where you can enjoy the best local cuisine.'),
(416, 'Hotel Rural Aribe - Arrigorri Restauracion', -1.26305, 42.9436, 'Santa Maria 33', '31671 Aribe', 'Navarra', 'Navarra', 'España', '948764466', 'http://www.hotelaribe.com', 'hotelaribe@gmail.com', 'https://www.hotelaribe.com/wp-content/uploads/2020/06/hotel-rural-aribe-habitacion-doble-2.jpg', 'Small family-run hotel in Aribe, way-in to the Irati Forest in the Pyrenees of Navarra. We offer our guests board and lodging as well as information and hints about our country area, aiming to be helpful during their holiday adventure, always taking into account the respect for our generous flora and fauna and our people and traditions. The hotel has 6 double rooms and 2 apartments apart from a small bar and restaurant premises.'),
(417, 'Hotel Urune', -2.69917, 43.2752, 'Barrio Txakale, 8', '48392 Muxika', 'Vizcaya', 'País Vasco', 'España', '944 651 663', 'http://www.urunehotela.com', 'urune@urunehotela.com', 'http://www.urunehotela.com/wp-content/uploads/2016/02/slow-life-1.jpg', 'Urune is born to create emotions and supposes the implementation of our dream: a calm and natural beautiful place to think, to work, learn, rest and enjoy; in the middle of the Urdaibai Biosphere Reserve. We open you the doors of our home, to enjoy nature, to delight the local gastronomy and to live our customes, CALM.'),
(418, 'LA CASA DE MADERA', -2.7834, 43.3375, 'Barrio Zameza 52A', '48114 Arrieta', 'Vizcaya', 'País Vasco', 'España', '946153657', 'http://lacasademadera.wordpress.com', '', 'https://lacasademadera.files.wordpress.com/2012/03/cropped-panoramica.jpg', 'La Casa de Madera is a Bed&Breakfast family house that is very well located to visit six of the ten main touristic targets in the Basque Country. It is 15-20 minutes from Bilbao Airport, the City Center (Bilbao), and beaches. It is less than ten minutes from the Natural Reservation Area (Urdaibai Biosphere Reservation).'),
(419, 'Legaire Etxea', -2.27761, 42.8619, 'San ´Martín 4', '01260 Asparrena', 'Álava', 'País Vasco', 'España', '607547916', 'http://www.legaireetxea.com', 'info@legaireetxea.com', 'http://www.legaireetxea.com/uploads/fotografias/fot12.jpg', 'Legaire etxea cuenta con grandes espacios comunes, como un amplio salón-comedor, con televisión, chimenea y asador, con acceso al jardín. Cocina completa, cuarto de baño comunitario, todo adaptado para minusválidos. Sus habitaciones están totalmente equipadas con baños individuales, televisión de plasma, dvd, hilo musical, wifi y calefacción, también disponemos de una cuna.'),
(420, 'Lete Apartamentuak', -2.11013, 43.1726, 'Lete Baserria S/N', '20494 Alkiza', 'Gipuzkoa', 'País Vasco', 'España', '0034943691264', 'http://www.letealkiza.com/', 'info@letealkiza.com', 'http://www.letealkiza.com/index_html_files/571.jpg', 'Country house restored seventeenth-eighteenth century, historical heritage with antique furniture and antiques. Located in a privileged environment in the heart of Gipuzkoa, the country house Lete is a good place to unwind and enjoy nature. The house-palace Lete is located in the town center of Alkiza, 100m from the Church of San Martín. It is a noble house with a coat of arms and is considered a historic partrimony. It was built before the year 1600, although only documents from it are preserved from that year. It has been restored, has four floors, the ground floor is one block, on the first floor the family lives and guests have the second floor at their disposal with a large living room with TV and library. All the furniture is of the time, which gives the house a museum aspect. New construction apartments, energy efficiency rating A. We have 4 apartments with a maximum capacity of 4 people. Each apartment comes equipped with a double room, a 1.5 m bed and another room with a bunk bed, two 1.05 m beds and a kitchen-living room with a sofa. These rooms have: Bathroom, TV, Wifi, living room with TV, underfloor heating and kitchen.'),
(421, 'Albergue Juvenil Ulia', -1.96287, 43.3287, 'Paseo De Ulia 297', '20013 San Sebastián', 'Gipuzkoa', 'País Vasco', 'España', '0034943483480', 'http://www.donostia.eus/albergues', 'ulia@donostia.eus', 'https://www.donostia.eus/info/visitante/albergues.nsf/0/9a34587ab5067d9ec1257f92002a2a93/contenido_cas/0.160?OpenElement&FieldElemFormat=jpg', 'The hostel is situated on the slopes of Monte Ulia, about 200 meters high. A 20 minute walk from the beach Zurriola, this hostel is an excellent location to enjoy the mountain and healthy living. The forest around the hostel is ideal to take walks on foot or by bicycle. The splendid views and scenery make it a heaven of relax and beauty. But at the same time, the proximity of the city allows you to enjoy San Sebastian and what it offers. Ulia hostel has rooms for 3-4 people and bungalows for 5-6 people equiped with a kitchen. Both rooms and bungalows have their own porch with direct access from the street. Free parking and WIFI, living area with TV and bar-restaurant service are offered.'),
(422, 'Casa rural Tierra y Madera', -3.08795, 42.8088, 'La Iglesia 10', '01423 Barrio', 'Álava', 'País Vasco', 'España', '34600549529', 'http://www.tierraymadera.com', 'tierraymadera.casarural@gmail.com', 'https://le-cdn.website-editor.net/8854e19914e24e0da329e814b61cc83d/dms3rep/multi/opt/IMG-20180901-WA0009-1920w.jpg', 'La Casa rural Tierra y Madera se encuentra en Barrio, un pequeño pueblo del interior de Alava (País Vasco). El pueblo de Barrio destaca por estar rodeado de una impresionante montaña, dotando a “Tierra y Madera” de unas vistas y entorno impresionante para los amantes de la naturaleza. Abierta en octubre del 2018, es una casa totalmente restaurada por sus propietarios piedra a piedra. Zuri y Edu regentan esta casa llena de encanto, donde se ha cuidado la decoración para que se integrase en la impresionante naturaleza que le rodea creando una atmosfera de relax y tranquilidad. Si por algo destaca esta casa es por como reciben en ella a las mascotas (perros, gatos…), tratándoles como si de de huéspedes VIP se tratasen. 100% dogfriendly. Además, puedes contar con ellos para organizar excursiones y visitas. Son grandes conocedores de la zona y del País Vasco y están siempre dispuestos y disponibles para aconsejaros.'),
(423, 'HOTEL ZERUPE', -2.17376, 43.2852, 'Zigordia 24', '20800 Zarautz', 'Gipuzkoa', 'País Vasco', 'España', '943508582', 'http://www.hotelzerupe.com', 'reservas@hotelzerupe.com', 'http://www.hotelzerupe.com/images/portfolio/galeria/hotel-zerupe-galeria-habitacion-3-g.jpg', 'ZERUPE :Under the sky. High and wide space, designed from an old nave by the studio Lurbel, in which concrete, steel, glass and natural wood are combined with photographer Jon Atxutegi’s big pictures of the surroundings. These artistic photos, stained glass windows of the 21st century, provide colour and a special atmosphere to the space. Peaceful and silent space, soundproofed. Comfort from the passivhaus philosophy and from the energy efficiency, led technology, free Wifi, air conditioning and modernity. A new hotel concept in one floor which provides different feelings in the centre of the town and offers the convenience of having its own parking beneath the hotel. Located in a peaceful area of the pedestrian centre of Zarautz, you could access on foot to the beach (150m), to the Town Hall square (100m), to the train station (150m), to the bus station (…). You will be able to walk around, enjoy the gastronomy and the surroundings in a space of quality.'),
(424, 'Agroturismo Lurdeia', -2.7372, 43.3834, 'Artike Auzoa 60', '48370 Bermeo', 'Vizcaya', 'País Vasco', 'España', '666 477 665', 'http://www.lurdeia.com', 'lurdeia@lurdeia.com', 'https://lurdeia.com/wp-content/uploads/sites/16/2020/05/lur11.jpeg', '8 rooms, kitchen, meeting room, panoramic views, garden, wooded area, lake, ecological gardens'),
(425, 'Azala', -2.87557, 42.7965, 'Lasierra 15', '01428 Lasierra', 'Álava', 'País Vasco', 'España', '665705136', 'http://www.azala.es', '', 'http://www.azala.es/images_secciones/grandes/1297337506p.jpg', 'AZALA está construido en un terreno de 4.700 m2, rodeado de encinar mediterráneo y cultivos agrícolas. Un entorno que permite el silencio, aislamiento, concentración y el disfrute del contacto con la naturaleza. El espacio está formado por: un terreno ajardinado de 4.000 m2 donde se ubican 5 cabañas independientes de madera de 42 m2 cada una. Apartamentos turísticos en el medio rural. Cada una de estas cabañas puede alojar a 4/5 personas. Consta de dos habitaciones, cocina-salón y cuarto de baño. Un espacio común que denominamos txoko y se trata de una cocina-salón grande, calefactada y equipada para grupos de 20 personas, con vitrocerámica, nevera, microondas, lavavajillas, útiles de cocina, chimenea, televisión, equipo multimedia y conexión WiFi.'),
(426, 'Agroturismo Iabiti-Aurrekoa', -2.85753, 43.283, 'Arteaga Auzoa 13', '48170 Zamudio', 'Vizcaya', 'País Vasco', 'España', '944522370', 'https://turismo.euskadi.eus/es/alojamientos/agroturismo-iabiti-aurrekoa/aa30-12375/es/', 'agroturismo.iabiti@gmail.com', 'https://media-cdn.tripadvisor.com/media/photo-m/1280/15/90/08/3c/agroturismo-iabiti-aurrekoa.jpg', '6 double rooms with bathroom, bed and breakfast'),
(427, 'Hotel Casa del Patrón', -2.82005, 42.9569, 'San Martin 2', '01130 Murgia', 'Álava', 'País Vasco', 'España', '34945462528', 'https://www.casadelpatron.com', 'hotel@casadelpatron.com', 'https://casadelpatron.com/wp-content/uploads/exterior_01-768x511.jpg', 'The Hotel is a beautiful rustic building from the early 19th century located in a pleasant pedestrian zone in the center of the town of Murgia. A few meters from the establishment there is a large free parking area , a children\'s area with swings and a garden area with an avant-garde sculptural complex. It offers a cozy glazed terrace with fireplace that allows you to enjoy the privileged enclave all year long. The Casa del Patron is located in the Villa de Murgia in a privileged location at the entrance of the Gorbeia Natural Park, the largest protected area in the Basque Country. Murgia, between Vitoria, which is only 15 minutes away by motorway, and Bilbao, just 30 minutes away, becomes an essential stop for those who wish to enjoy the tranquility and beauty of a natural environment without giving up the multiple recreational, cultural and commercial offers offered by Vitoria and Bilbao. the Hotel has 14 rooms fully equipped with heating and air conditioning, television, bathroom with bath or shower and free Wi-Fi access You can also find has, an indoor glazed terrace, restaurant, private dining room, and garage with direct access to rooms.'),
(429, 'AGROTURISMO IBARRE', -2.377, 43.0969, 'Irimoegi Auzoa 1', '20577 Antzuola', 'Gipuzkoa', 'País Vasco', 'España', '00 34 660732615', 'http://www.ibarre.com', 'info@ibarre.com', 'https://ibarre.com/wp-content/uploads/2020/06/agroturismo-IBARRE.jpg', 'Recently refurbished agro-tourism house located near the centre of the town of Antzuola in the district of El Alto Deba in the heart of the Basque Country. Ibarre is on the GI-632PK-19 road, a few kilometres from Bergara and Zumárraga. Typical Basque atmosphere and friendly service.'),
(430, 'Urresillo Landetxea', -2.78284, 43.3592, 'Barrio Meñakabarrena 27', '48120 Meñaka', 'Vizcaya', 'País Vasco', 'España', '688802467', 'http://ec.europa.eu/ecat/hotels/en-1310100-urresillo-landetxea-menaka', '', 'https://p.bookcdn.com/data/Photos/r1536x522/5223/522303/522303141/Casa-Rural-Urresillo-Landetxea-photos-Exterior.JPEG', 'TOURIST APARMENTS AND GARDENS NEAR BILBAO'),
(431, 'Gorosarri Landetxea', -2.56317, 42.9948, 'Barrio Zarimutz, 32 --', '20540 Eskoriatza', 'Vizcaya', 'País Vasco', 'España', '688800479', 'http://www.gorosarri.com/', '', 'https://gorosarri.com/wp-content/uploads/2016/02/AGP60091500x516px1.jpg', 'The charming Gorosarri rural house is situated on an old farm and has six apartments for you to occupy with your family or your partner. Our apartments can house from 2 to 4 persons'),
(433, 'CAMPING EL BERGUEDA', 1.83575, 42.2181, 'Ctra. B-400 Km 3,5', '08694 Guardiola De Berguedà', 'Barcelona', 'Cataluña', 'España', '0034 937 22 74 32', 'http://www.campingbergueda.com', 'info@campingbergueda.com', 'http://www.campingbergueda.com/wp-content/uploads/2015/12/IMG_4864-1-e1449937133927.jpg', 'Disfrute de sus vacaciones descubriendo uno de los rincones más naturales de los Pirineos de Barcelona : El Berguedà, al lado del Parque Natural Cadí-Moixeró y del Macizo del Pedraforca. Disfrute de la naturaleza, la tranquilidad i el espacio.'),
(434, 'CAMPS DE VILARRASA-CAL CANDI', 1.92239, 42.1314, 'Carrer Clotassos, 18', '08613 Vilada', 'Barcelona', 'Cataluña', 'España', '0034 93 823 83 13', 'https://calcandi.simdif.com/', 'calcandi.vilada@gmail.com', 'https://calcandi.simdif.com/images/public/sd_5daee1dee8ecc.jpg?nocache=1606908994', ''),
(435, 'MIREIA FONT I VIDAL', 0.936635, 42.3247, 'C/La Bedoga 2', '25514 Senterada', 'Lerida', 'Cataluña', 'España', '34 973 661 787', 'https://www.casaleonardo.net/', '', 'https://www.casaleonardo.net/wp-content/uploads/DSC_0340.jpg', 'Casa Leonardo es una casa rural con encanto que se encuentra en el pueblo de Senterada, a la entrada de la vall Fosca'),
(436, 'HOTEL ES BAULÓ', 3.15916, 39.7599, 'Av. Santa Margalida, 28', '7458 Can Picafort', 'Baleares', 'Baleares', 'España', '34 971456281', 'http://www.esbaulo.com', 'info@esbaulo.com', 'https://www.esbaulo.com/cache/d3/85/d3859d67fe4d15777bfb4f0495b28a62.jpg', 'Un hotel ecológico en la Bahía de Alcudia que te propone una estancia muy confortable en una de las zonas más paradisíacas de la isla. Su ubicación privilegiada le sitúa entre el pueblecito de costa de Can Picafort y la playa de Son Bauló, en un paisaje lleno de encanto, cultura y tradición.'),
(437, 'Ellauri Hotel', -2.74118, 43.0927, 'Altzusta 38', '48144 Zeanuri', 'Vizcaya', 'País Vasco', 'España', '34686 07 77 96', 'https://www.ellauri.com', 'info@ellauri.com', 'https://www.ellauri.com/wp-content/uploads/revslider/ellaurihotela/Ellau_Hotela_Landscape_Hotel_Slider1.jpg', 'Ubicado en pleno corazón del País Vasco, en la Reserva Natural de Gorbeia, se sitúa nuestro Hotel Ellauri. En él encontrarás el lugar perfecto para descansar, relajarte y desconectar del estrés en un entorno privilegiado. Un hotel con mucho encanto cuya historia te cautivará.'),
(438, 'Hotel Restaurant l\'Algadir del Delta', 0.687757, 40.6471, 'Ronda Dels Pins, 27', '43549 Poble Nou', 'Tarragona', 'Cataluña', 'España', '34 977 744 559', 'https://www.hotelalgadirdelta.com/', 'gerencia@hotelalgadirdelta.com', 'https://www.hotelalgadirdelta.com/wp-content/uploads/2015/03/Hotel_Algadir_Delta-30-de-103.jpg', 'Inaugurado en Octubre de 2007, el Hotel Algadir del Delta es un Hotel Gastronómico de ambiente familiar, situado en un entorno natural que ayuda a la calma y el reposo, en la tranquila localidad de El Poble Nou del Delta del Ebro.'),
(439, 'SOMLOM', 2.43527, 41.7056, 'C/ Oratge 11', '08461 Sant Esteve De Palautordera', 'Barcelona', 'Cataluña', 'España', '34 938 48 20 73', 'http://www.somlom.com', 'info@somlom.com', 'https://www.somlom.com/FitxersWeb/25473/banner-generic-somlom-1.jpg', 'Somos hotel, somos bienestar y somos formación. En Somlom os ofrecemos una experiencia global de cura, descanso, crecimiento personal y profesional en un mismo espacio. Gozamos de una ubicación privilegiada, nuestro centro se encuentra a los pies del Parque Natural del Montseny, en el pueblo de Sant Esteve de Palautordera, en la comarca del Vallès Oriental, provincia de Barcelona.'),
(440, 'Hotel Arbe', -2.36352, 43.3045, 'Barrio Laranga Auzoa, S/N', '20830 Mutriku', 'Gipuzkoa', 'País Vasco', 'España', '943 60 47 49', 'https://hotelarbe.com/es/', 'info@hotelarbe.com', 'https://hotelarbe.com/wp-content/uploads/2018/11/hotel-arbe-026-mutriku-deba-ondarroa-romantico-habitacion-encanto-costa-pais-vasco-webcam-playa-alkolea-piscina-terraza-balcon-cesped-mar-cantabrico-acantilado-2-33x.jpg', 'Hotel de 11 habitaciones y piscina'),
(441, 'L\'Avenc de Tavertet, Apartaments i casetes', 2.44165, 42.0056, 'Mas L\'avenc, S/N Camí Rural', '08511 Tavertet', 'Barcelona', 'Cataluña', 'España', '34 93 881 61 59', 'http://www.avenc.com/', 'info@avenc.com', 'http://www.avenc.com/wp-content/uploads/2020/05/sliderhome4-1.jpg', 'La Sima es un apart-hotel rural, situado en un espectacular paisaje natural sobre riscos, entre bosques y campos. Ofrece diferentes tipos de alojamiento; desde el encanto rústico de las Casetas hasta la amplitud y la luz de las habitaciones, estudios y apartamentos ubicados en el ala más moderna, un edificio bioclimático construido en 2012 que, aparte, alberga varias espacios comunes, comedor, sala de masajes y una increíble piscina interior.'),
(442, 'masCorbella', 1.12677, 41.2651, 'Camí De L\'albiol S/N', '43460 Alcover', 'Tarragona', 'Cataluña', 'España', '34 689 16 12 52', 'http://www.mascorbella.com', 'mascorbella@mascorbella.com', 'https://www.mascorbella.com/wp-content/uploads/2014/10/MC_foto40.jpg', 'Masía aislada de 450 m2 en una finca de 60 hectáreas al pie del Parque natural de las Montañas de Prades. Jardines propios . Zona de ocio . Zona de barbacoa exterior comunitaria y porche de 1000 m2 . Piscina . Ideal para grupos numerosos de familiares o amigos de 6 hasta 30 personas.Se alquilan 3 casas por separado o conjuntamente.'),
(443, 'MAS LLAGOSTERA', 1.4637, 41.2732, 'Ctra. T-240 Km 0,5', '43717 La Bisbal Del Penedès', 'Tarragona', 'Cataluña', 'España', '34 635 55 69 55', 'https://www.masllagostera.com/ca/', 'info@masllagostera.com', 'https://www.masllagostera.com/templates/yootheme/cache/3n-6dbe4497.jpeg', 'Mas Llagostera, premio al mejor alojamiento enoturístico de Catalunya de 2017, ofrece experiencias inolvidables entre viñas para compartir con la familia y/o amigos.'),
(444, 'Sleep Green', 2.16585, 41.3868, 'Ronda De La Universitat, 15', '08007 Barcelona', 'Barcelona', 'Cataluña', 'España', '34 635 669 021', 'https://sleepgreenbarcelona.com/de/sleep-green-homepage/', 'info@sleepgreenbarcelona.com', 'https://74130-283776-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2015/01/Sleep-Green-Gallery-Image-6.jpg', 'Sleep Green is the first urban youth hostel in Spain that was awarded with the EU Ecolabel in recognition of its commitment to sustainable tourism and protection of the local environment.  Sleep Green is a small, cozy youth hostel in Barcelona’s beautiful neighborhood Eixample. Our location is unbeatable, allowing you to easily discover the city by foot from the hostel. There are supermarkets, bars, clubs, main tourist sites and public transportation all on our doorstep. Sleep Green features comfortable air-conditioned dormitories of only 4 to 6 beds. All rooms have a balcony and brand-new mattresses! The hostel is equipped with a guest kitchen to cook meals and have breakfast.'),
(445, 'Cabañas en los arboles', -2.69589, 43.0506, 'Carretera, N-240,Entre Km 26 Y 27, Desvío Otxandio', '48044 Zeanuri', 'Vizcaya', 'País Vasco', 'España', '34692738920', 'http://cabanasenlosarboles.com/es', 'info@cabanasenlosarboles.com', 'http://cabanasenlosarboles.com/files/images/galeria2/photo_033.jpg', 'SUMÉRGETE EN EL BOSQUE'),
(446, 'Camping & Bungalows Zumaia', -2.24788, 43.2899, 'Basusta Bidea 16', '20750, Zumaia', 'Vizcaya', 'País Vasco', 'España', '943860475', 'https://www.campingzumaia.com', '', 'https://www.campingzumaia.com/images/camping-zumaia/vistas/camping-zumaia-vistas-01.jpg', 'El Camping Bungalows Zumaia de 1ª categoría, se encuentra en Zumaia, villa situada dentro del Geoparque de Guipuzcoa, País Vasco, rodeada de verdes montañas que descienden hasta el mar, formando los acantilados del Flysch. Es, sin duda, uno de los tramos más hermosos de la costa guipuzcoana.'),
(447, 'Camping el Roble Verde', -2.87936, 42.7955, 'Nuvilla 99', '01428 Nuvilla', 'Álava', 'País Vasco', 'España', '945063350', 'http://www.campingelrobleverde.com', 'info@campingelrobleverde.com', 'https://campingelrobleverde.com/wp-content/uploads/2015/02/parque-infantil-2-570x455.jpg', 'Camping de ambiente tranquilo y familiar, al Sur de Álava, en el pueblo de Nuvilla, Ribera Alta. Entre Vitoria-Gasteiz y La Rioja, te ofrecemos un entorno ideal para disfrutar de la naturaleza y una buena ubicación para conocer los principales puntos turísticos de Euskadi. '),
(448, 'Camping Angosto', -3.06868, 42.8425, 'Villanañe-Angosto 2, BIS', '01426 Valdegovía', 'Álava', 'País Vasco', 'España', '945353271', 'http://www.camping-angosto.com', 'info@camping-angosto.com', 'https://www.camping-angosto.com/images/galeria/cabanas-4-personas-villanane/camping-en-anana-4PAX-01.jpg', 'El Camping Angosto, es un camping de interior de 1ª categoría, ubicado en Villanañe, en el Valle de Valdegovía, Araba.'),
(500, 'Gran Meliá Colón', -5.99855, 37.3909, 'Calle Canalejas 1', ' Sevilla Andalucía', 'Sevilla', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/seville/gran-melia-colon/index.html', 'granmeliacolon@melia.com', 'https://th.bing.com/th/id/OIP.XLCp7Og6_Ml5mcPjGXTeCgAAAA?w=293&h=196&c=7&o=5&dpr=1.25&pid=1.7', 'Ubicado en el centro histórico, la experiencia en este hotel de 5 estrellas ofrece un toque vanguardista del servicio de lujo tradicional perfecto para viajes de ocio y negocios.'),
(501, 'Gran Meliá de Mar', 2.53331, 39.5727, 'Paseo de las Illetas, 7', ' Mallorca ', 'Baleares', '', 'Spain', '', 'https://www.melia.com/es/hoteles/espana/mallorca/gran-melia-de-mar/index.html', 'gran.melia.de.mar@melia.com', 'https://www.kenwoodtravel.co.uk/images/properties/3058/Gran%20Melia%20De%20Mar%20SkyPool.jpg', 'Un complejo solo para adultos guiado por una cultura hedonista de descanso y relajación, único en la isla y miembro de la exclusiva colección de The Leading Hotels of the World.'),
(502, 'Gran Meliá Fénix', -3.68928, 40.4265, 'Calle de Hermosilla, 2', 'Madrid', 'Madrid', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/madrid/gran-melia-fenix/index.html', 'gran.melia.fenix@melia.com', 'https://media-cdn.tripadvisor.com/media/photo-s/06/da/61/8e/fachada.jpg', 'Hotel exclusivo en la milla de oro de Madrid. Desde la Plaza de Colón, este hotel de 5 estrellas, miembro de «The Leading Hotels of the World», ofrece una experiencia con un toque vanguardista del servicio de lujo tradicional.'),
(503, 'Gran Meliá Palacio de Isora', -16.8177, 28.2086, 'Avenida Los Océanos, s/n', 'Alcalá', 'Las Palmas', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/tenerife/gran-melia-palacio-de-isora/index.html', 'gran.melia.palacio.isora@melia.com', 'https://www.melia.com/dam/jcr:a42193e3-344f-48b2-a2ed-3f0969f18c01/09bGranMeliaPalacioDeIsora-Infinity_Pool.jpg', 'Situado entre el Océano Atlántico y el majestuoso Teide, este exclusivo resort con un toque vanguardista del servicio de lujo tradicional ofrece una experiencia mágica.'),
(504, 'Hard Rock Hotel Tenerife', -16.7779, 28.1211, 'Avenida Adeje 300 nº5', 'Playa Paraíso - Adeje', 'Santa Cruz de Tenerife', '', 'Spain', '', 'https://www.hardrockhoteltenerife.com/', 'info@hrhtenerife.com', 'https://q-xx.bstatic.com/xdata/images/hotel/max1280x900/208852525.jpg?k=33d45f537f737728732f7427a6f9957715d93a51fd70d30d2b034166db77a114&o=', 'rd Rock Hotel Tenerife es un hotel completamente renovado, situado en la isla volcánica de Tenerife (en la costa noroeste de África en el océano Atlántico), uno de los destinos más fascinantes del mundo donde Hard Rock Hotel Tenerife ha encontrado su nuevo hogar en las soleadas costas del sur de Adeje y estamos listos para revolucionar tus vacaciones cuando nos elijas para tu próxima escapada a las Islas Canarias. Nuestra exclusiva línea de playa se extiende entre nuestras torres Oasis y Nirvana, con tres piscinas de aguas transparentes que abarcan toda la propiedad y la zona recreativa…'),
(505, 'Hotel Don Pepe, a Gran Meliá Hotel', -4.90212, 36.5086, 'Calle José Meliá s/n', 'Marbella', 'Málaga', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/marbella/gran-melia-don-pepe/index.html', 'gran.melia.don.pepe@melia.com', 'https://www.melia.com/dam/jcr:7712f512-392d-4b95-ac1c-6806f123dffb/005GranMeliaDonPepe-General_Pool.jpg', 'Situado en la Costa del Sol, cerca de la Sierra Blanca, la experiencia en este hotel incluye un toque vanguardista del servicio de lujo tradicional. Ideal para descubrir Marbella.'),
(506, 'Hotel Meliá Sevilla', -5.98338, 37.3779, 'Calle Doctor Pedro de Castro Nº1', ' Sevilla ', 'Sevilla', '', 'Spain', '', 'Hotel Melia Sevilla, Hotel moderno en Sevilla centro | Melia.com', 'antonio.navarro@melia.com', 'https://www.melia.com/dam/jcr:a34064fc-e2f8-4a3e-9854-d2c6382c06e6/401MeliaSevilla-Pool%20Eagle%20View%20(1).jpg', 'on una ubicación privilegiada junto al casco histórico, el recientemente reformado Melia Sevilla es el hotel ideal para su viaje de placer o de trabajo. Conozca nuestro exclusivo servicio The Level, una experiencia que hará su estancia inolvidabl'),
(507, 'Hotel Palma Bellver', 2.63134, 39.5684, 'Paseo Maritimo ,11', 'Mallorca', 'Baleares', '', 'Spain', '', 'Hotel Palma Bellver by Melia, Hotel en Palma de Mallorca | Melia.com', 'javier.baqueiro@melia.com', 'https://www.melia.com/dam/jcr:6ad8a088-44ea-4800-8fd9-0489d6998abd/305HotelPalmaBellver-Pool_(1).jpg', 'En el corazón del paseo marítimo, con vistas al puerto deportivo y la Catedral y cerca de las principales áreas comerciales y de ocio de la ciudad.'),
(508, 'Hotel Victoria, a Gran Meliá Hotel', 2.62397, 39.5639, 'Avinguda de Joan Miró, 21', 'Mallorca', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/gran-melia-victoria/index.html', 'gran.melia.victoria@melia.com', 'https://www.melia.com/dam/jcr:893299f5-da5b-4890-bf93-90d847d00c55/300GranMeliaVictoria-Swimming_Pool_(1).jpg', 'El Hotel Victoria Gran Meliá es un hotel de 5 estrellas situado en primera línea del Paseo Marítimo con vistas a las maravillosas aguas azules de la Bahía. Las habitaciones han sido renovadas y la mayoría cuenta con impresionantes vistas panorámicas.'),
(509, 'Iberostar Albufera Park-Iberostar Albufera Playa', 3.12064, 39.7954, 'Playa de Muro, s/n', 'Mallorca', 'Baleares', '', 'Spain', '', 'https://www.iberostar.com/en/hotels/majorca/iberostar-albufera-playa', 'mariadelmar.vadell@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/46154/crops/750:466/540/image.jpg', 'n hotel a estrenar, a pie de playa, luminoso y vanguardista, con habitaciones pensadas para estar juntos. Tenemos un sinfín de actividades que disfrutarán los más pequeños, piscina exterior, Aquafun y climatizada, instalaciones para ciclistas y más de 7 opciones con la mejor gastronomía mediterránea.'),
(510, 'Iberostar Andalucía Playa', 3.11514, 39.8092, 'Novo Sancti Petri', 'Chiclana de la Frontera', 'Cádiz', '', 'Spain', '', 'https://www.iberostar.com', 'cristina.morata@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/46481/crops/750:466/540/image.jpg', 'Iberostar Selection Andalucía Playa es un hotel 5 estrellas ubicado en el mejor acceso a esta histórica playa. Relájate en la piscina de nuestro spa, disfruta la deliciosa gastronomía andaluza o la belleza de nuestros jardines. Y, por supuesto, no te olvides de jugar en nuestro club de golf, obra maestra de Severiano Ballesteros, 36 hoyos concebidos para los espíritus más deportistas.'),
(511, 'Iberostar Anthelia', -16.7353, 28.0878, 'Londres, 15', 'Costa Adeje', 'Santa Cruz de Tenerife', '', 'Spain', '', 'https://www.iberostar.com', 'sonia.diaz@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/51578/crops/16:9/1920/image.jpeg', 'Iberostar Anthelia es el mejor Todo Incluido de Tenerife, uno de los más premiados de España y Europa y un hotel extraordinario para familias. Entre jardines privilegiados y a los pies de la Playa de Fañabé, un cinco estrellas de arquitectura única que reproduce la estructura de un pueblo canario y acoge excelentes instalaciones: habitaciones pensadas para los niños, piscina de adultos e infantil, con toboganes y barco pirata, y un spa vanguardista. Disfruta nuestra variada oferta en sus 5 restaurantes y 3 bares, y degusta la gastronomía local.'),
(512, 'Iberostar Bahía de Palma', 2.73735, 39.5244, 'C/ Marbella, 32', '07010 Palma De Mallorca Baleares', 'Baleares', '', 'Spain', '', 'Hotel en la playa en Mallorca | Iberostar Bahía de Palma', 'mariaantonia.amengual@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/26134/crops/16:9/1920/image.jpeg', 'Nuestro hotel a orillas del Mediterráneo ofrece experiencias únicas e inolvidables que sin duda vale la pena probar: darse un chapuzón en nuestra piscina en la azotea con vistas a la bahía; admirando la puesta de sol acompañado por un DJ en nuestro restaurante Sea Soul frente al mar que ofrece cocina mediterránea; relajarse en su fantástica habitación; disfrutando de la decoración tradicional mallorquina de este hotel que está lleno de vida...Iberostar Bahía de Palma es un hotel pensado para adultos, un oasis tranquilo en Playa de Palma,a tan solo 15 minutos del centro de la ciudad y a 5 minutos del aeropuerto. ¡Mallorca es verdaderamente imperdible!'),
(513, 'Iberostar Bouganville Playa', -16.7319, 28.0742, 'San Eugenio', 'Costa Adeje', 'Santa Cruz de Tenerife', '', 'Spain', '', 'https://www.iberostar.com', 'bousdi@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/49920/crops/750:466/540/image.jpeg', 'En pleno paseo marítimo de San Eugenio, a 20 metros de la playa del Bobo, junto al puerto deportivo Colón para que salir de excursión sea sencillo, y muy cerca de un campo de golf, así de bien ubicado está Iberostar Bouganville Playa. Un hotel para familias en el que los más pequeños estrenarán nuestro nuevo Aquafun y disfrutarán nuestro completo y divertido programa de actividades Star Camp.'),
(514, 'Iberostar Cala Millor', 2.67987, 39.6007, 'C/ Castell, 7', '07010 Palma De Mallorca', 'Baleares', '', 'Spain', '', 'Hotel con spa en Mallorca | Iberostar Cala Millor', 'camdir@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/11716/crops/16:9/1920/image.jpg', '¿Has dormido alguna vez en un hotel frente al mar, con la pared frontal de cristal, para ver el amanecer desde la cama? Este hotel se encuentra en la zona más apacible de Cala Millor y tiene acceso directo a la playa. Iberostar Cala Millor es un rincón de tranquilidad, cálido y moderno, pensado especialmente para adultos, integrado en plena naturaleza junto a la zona protegida de punta de n’Amer.'),
(515, 'Iberostar Ciudad Blanca', 2.63481, 39.6156, 'Avda. Albufera, nº 30', '07010 Palma De Mallorca ', 'Baleares', '', 'Spain', '', 'https://www.iberostar.com/hoteles/mallorca/iberostar-ciudad-blanca', 'bladir@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/20442/crops/16:9/1920/image.jpeg', 'Alojándote en nuestro hotel sumarás todas las comodidades de unas vacaciones a pie de la playa más larga, accesible y familiar de Mallorca. Para que la disfrutes, te acercamos a la orilla la mejor gastronomía en nuestro Sea Soul Restaurant & Beach Club. Y en el hotel te esperamos con habitaciones familiares, con todo el entretenimiento de Star Camp y sus actividades para los más pequeños, incluida la piscina de toboganes. Todo en un entorno de pinares y jardines que te permitirá respirar la belleza del Mediterráneo.'),
(516, 'Iberostar Club Cala Barca', 3.19993, 39.3526, 'Sa Barca Trencada, s/n', 'Santanyi', 'Baleares', '', 'Spain', '', 'https://www.iberostar.com/en/hotels/majorca/iberostar-club-cala-barca', 'catalina.fuster@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/34436/crops/16:9/1920/image.jpeg', 'Sabías que en el resort de Iberostar Club Cala Barca caben más de 10 campos de fútbol reglamentarios? Es lo que ocupan nuestras espectaculares instalaciones para las mejores vacaciones en familia: 10 piscinas, 5 de ellas infantiles con barco pirata, una nueva piscina de bola, pádel, club de buceo, y un sinfín de actividades infantiles y juveniles de nuestro programa Star Camp, son algunas de las posibilidades que te ofrecemos.'),
(517, 'Iberostar Costa del Sol', 2.63481, 39.6156, 'Urbanización Costalita, s/n.', 'Puente de Cancelada', 'Málaga', '', 'Spain', '', 'Hotel en Estepona con Todo Incluido Iberostar Costa del Sol | Iberostar', 'cdsdir@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/48161/crops/750:466/540/image.jpeg', 'Sabías que en Málaga luce el sol más de 320 días al año? Puedes comprobarlo en Iberostar Costa del Sol, un hotel ubicado sobre la playa más extensa de Estepona. Elige entre varios tipos de habitaciones. Te recomendamos las suites con piscina privada o las sharing pool con vistas al mar. Si vienes en familia, tenemos habitaciones para compartir espacio y tiempo y un sinfín de actividades en nuestro Star Camp.'),
(518, 'Iberostar Cristina', 2.74059, 39.5257, 'Bartolome Xamena, s/n', 'Playa de Palma', 'Baleares', '', 'Spain', '', 'https://www.iberostar.com/en/hotels/majorca/iberostar-cristina', 'MariaAntonia.Amengual@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/55334/crops/750:466/540/image.jpeg', 'El hotel Iberostar Cristina ofrece, además, muchas alternativas para recuperar tu mejor tú: tenis, fútbol, pádel o natación en nuestra piscina climatizada y en las exteriores, o un largo paseo por la playa. Disfruta de nuestro huerto propio y de unos jardines mantenidos con planta de compost. Cuida el entorno con nosotros y cuídate con un Todo Incluido'),
(519, 'Iberostar Fuerteventura Palace', -15.4747, 28.0605, 'Pje. Playa, nº 1', 'Urb. Las Gaviotas', 'Las Palmas', '', 'Spain', '', 'Hotel en Jandía de 5 estrellas | Iberostar Selection Fuerteventura Palace', 'calidadprl.fue@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/56298/crops/750:466/540/image.jpeg', '¿Necesitas un buen descanso? Tus pies y tu mirada se perderán en la extensa playa de Jandía. Te abrimos las puertas del hotel Iberostar Selection Fuerteventura Palace, para que te adentres en la atmósfera de tranquilidad que brinda la isla. El único esfuerzo que tendrás que hacer será el de elegir entre mar o piscina climatizada, sol o noche estrellada, sauna o masaje, cocina autóctona en el buffet o restaurante japonés frente a la playa… Si no te decides, también lo puedes probar todo, especialmente si te animas a unirte a Star Prestige, el servicio que te da acceso a zonas exclusivas y disponibilidad de las mejores habitaciones.'),
(520, 'Iberostar Grand Hotel el Mirador', -16.2912, 28.4567, 'Avda. Bruselas, s/nº', '38660 Santa Cruz De Tenerife Canarias', 'Santa Cruz de Tenerife', '', 'Spain', '', 'Hotel de 5 estrellas en Tenerife Iberostar Grand El Mirador | Iberostar', 'laura.dominguez@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/34429/crops/16:9/1920/image.jpeg', 'Iberostar Grand El Mirador es un hotel diseñado con una cuidada y romántica decoración y repleto de detalles que te harán sentir como en un cuento de hadas. Se encuentra en la milla de oro de Costa Adeje, al pie de la playa del Duque y muy cerca del campo de golf. Todas sus habitaciones se abren al mar y nuestra zona Star Prestige La Balconada, permite disfrutar de unas instalaciones únicas y del personalizado servicio de mayordomía y concierge.'),
(521, 'Iberostar Grand Hotel Portals Nous', 2.65041, 39.5903, 'C/ Falconer, 19', '07010 Palma De Mallorca ', 'Baleares', '', 'Spain', '', 'Hotel de lujo en Mallorca | Iberostar Grand Hotel Portals Nous', 'noudir@iberostar.com', '', ''),
(522, 'Iberostar Grand Mencey', -16.2534, 28.4744, 'Doctor José Naveiras, 38', 'Santa Cruz de Tenerife, Canarias 38004', 'Santa Cruz de Tenerife', '', 'Spain', '', 'https://www.iberostar.com', 'Mcysdi@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/51613/crops/750:466/540/image.jpeg', 'Iberostar Heritage Grand Mencey le ofrece una experiencia a la altura del nombre en el único hotel de gran lujo de Santa Cruz de Tenerife y a diez minutos caminando del centro. Por eso lo han elegido monarcas, actores, músicos y artistas de renombre.\n Disfrute de un hotel vanguardista que ha respetado sus más de 50 años de historia conservando el sabor de la arquitectura canaria. Relájese en sus jardines, su piscina y sus más de 4.500 m² de SPA Sensations.'),
(523, 'Iberostar Isla Canela', -7.34679, 37.183, 'Avenida de la Mojarra s/n', 'Ayamonte', 'Huelva', '', 'Spain', '', 'https://www.grupoiberostar.com', 'catalina.mas@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/51539/crops/750:466/540/image.jpeg', 'Iberostar Isla Canela es un hotel familiar y acogedor a pie de la playa y frente a un largo paseo para disfrutar los atardeceres. Todo está pensado para vosotros: habitaciones comunicadas, una inmensa piscina exterior con su bar para refrescarse y una interior. Disfruta de infinidad de actividades para niños y un sinfín de posibilidades de cuidarte en el spa o mediante el programa Aliveness que te ayuda a reconectar .');
INSERT INTO `alojamientos` (`ALID`, `NOMBRE`, `LONGITUD`, `LATITUD`, `DIRECCION`, `LOCALIDAD`, `PROVINCIA`, `COMUNIDAD`, `PAIS`, `TELEFONO`, `WEBSITE`, `EMAIL`, `LOGO`, `DESCRIPCION`) VALUES
(524, 'Iberostar Lanzarote Park', -13.8389, 28.8571, 'Avda. Archipiélago, 7', 'Yaiza', 'Las Palmas', '', 'Spain', '', 'https://www.iberostar.com', 'lansdi@iberostar.com', 'https://hotels1.cdn.iberostar.com/uploads/image/49038/crops/750:466/540/image.jpg', 'Iberostar Selection Lanzarote Park, cuyo proyecto supervisó el famoso arquitecto César Manrique, reproduce en su forma 3 zocos que se abren a una vista espectacular del Océano, en la primera línea de Playa Blanca. Este 5 estrellas fue, en 2018, el hotel Top 3 gastronómico de España según TripAdvisor: sus 2 restaurantes y 5 bares incluyen un food truck y el Sports Bar para atender a los paladares más exigentes. Los niños disfrutarán en un Aquafun hecho a medida, con volcán incluido. Y si vienes en pareja o con amigos, nuestro servicio Star Prestige te ofrece habitaciones excepcionales, servicios exclusivos y acceso a áreas reservadas.'),
(525, 'Iberostar las Dalias', -16.2912, 28.4567, 'C/ Gran Bretaña, s/nº', '38670 Santa Cruz De Tenerife', 'Santa Cruz de Tenerife', '', 'Spain', '', '', 'daldir@iberostar.com', '', ''),
(526, 'Iberostar Las Letras', -3.69934, 40.4195, 'C/ Gran vía, 11', '07010 Madrid ', 'Madrid', '', 'Spain', '', '', 'letdir@iberostar.com', '', ''),
(527, 'Iberostar Llaüt Palace', 2.75145, 39.5136, 'Avda. d\'Amèrica, 2', '07300 Palma De Mallorca Baleares', 'Baleares', '', 'Spain', '', '', 'mariaantonia.amengual@iberostar.com', '', ''),
(528, 'Iberostar Málaga Playa', -3.97222, 36.731, 'Ferrara s/n', 'Torrox-Costa', 'Málaga', '', 'Spain', '', 'https://www.grupoiberostar.com', 'catalina.mas@iberostar.com', '', ''),
(529, 'Iberostar Marbella Coral Beach', 2.63481, 39.6156, 'Ctra. Nacional 340, km 176', 'Urb. Coral Beach', 'Málaga', '', 'Spain', '', '', 'mabdir@iberostar.com', '', ''),
(530, 'Iberostar Paseo de Gracia', 2.16945, 41.3881, 'C/ Passeig de Gràcia, 1', '07010 Barcelona Barcelona', 'Baleares', '', 'Spain', '', '', 'bcndir@iberostar.com', '', ''),
(531, 'Iberostar Pinos Park', 3.43442, 39.7016, 'Avinguda Canyamel, 33', 'Capdepera', 'Málaga', '', 'Spain', '', 'https://www.iberostar.com/en/hotels/majorca/iberostar-pinos-park', 'catalina.mas@iberostar.com', '', ''),
(532, 'Iberostar Playa de Muro', 2.68615, 39.5786, 'Avda. Albufera s/n', '07300 Palma De Mallorca', 'Baleares', '', 'Spain', '', '', 'miquelangel.obrador@iberostar.com', '', ''),
(533, 'Iberostar Playa de Muro Village', 2.68615, 39.5786, 'Avda. Albufera s/n', '07300 Palma De Mallorca ', 'Baleares', '', 'Spain', '', '', 'miquelangel.obrador@iberostar.com', '', ''),
(534, 'Iberostar Playa de Palma', 2.73847, 39.5234, 'C/ Marbella, 36', '07010 Palma De Mallorca ', 'Baleares', '', 'Spain', '', '', 'mariaantonia.amengual@iberostar.com', '', ''),
(535, 'Iberostar Playa Gaviotas', -14.3183, 28.0605, 'Pasaje Playa Nº 2', 'Las Gaviotas', 'Las Palmas', '', 'Spain', '', 'https://www.iberostar.com', 'inga.cabrera@iberostar.com', '', ''),
(536, 'Iberostar Playa Gaviotas Park', -15.4747, 28.0605, 'Pasaje Playa, 3', 'Urb. Las Gaviotas', 'Las Palmas', '', 'Spain', '', '', 'calidadprl.fue@iberostar.com', '', ''),
(537, 'Iberostar Royal Andalus', -6.14865, 36.3376, 'Novo Sancti Petri', 'Chiclana de la Frontera', 'Cádiz', '', 'Spain', '', 'https://www.iberostar.com', 'cristina.morata@iberostar.com', '', ''),
(538, 'Iberostar Sábila', -16.2639, 28.4608, 'Avda. Ernesto Sarti, 5', '07010 Santa Cruz De Tenerife Canarias', 'Santa Cruz de Tenerife', '', 'Spain', '', '', 'laura.dominguez@iberostar.com', '', ''),
(539, 'Iberostar Santa Eulàlia', 1.41954, 38.9062, 'C/ Mestral, 42', 'URB. S\'Argamassa', 'Baleares', '', 'Spain', '', '', 'seudir@iberostar.com', '', ''),
(540, 'Iberostar Suite Hotel Jardín del Sol', 2.73492, 39.5926, 'C/ Huguet des Far, s/n', 'Urb. Es Castellot', 'Baleares', '', 'Spain', '', '', 'jardir@iberostar.com', '', ''),
(541, 'Innside Palma Bosque', 2.62572, 39.5669, 'Camilo José Cela, 5', '07014 Mallorca ', 'Baleares', '', 'Spain', '', '', 'Innside.bosque@melia.com', '', ''),
(542, 'Kempinski Hotel Bahía', -4.45947, 36.6888, 'Ctra de Cadiz km. 159', 'Malaga ', 'Málaga', '', 'Spain', '', 'https://www.kempinski.com/en/marbella/hotel-bahia/', 'reservations.estepona@kempinski.com', '', ''),
(543, 'ME Ibiza', 1.41954, 38.9062, 'Urbanizacion S\'Argamassa, 153', 'Santa Eulalia del Rio', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/ibiza/me-ibiza/index.html?gclid=CMzJh_TtjMACFYeXvQodBKcAJw', 'meibiza@melia.com', '', ''),
(544, 'ME Madrid Reina Victoria', -3.70364, 40.4145, 'Plaza de Santa Ana, 14', 'Madrid ', 'Madrid', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/madrid/me-madrid-reina-victoria/index.html', 'memadrid@melia.com', '', ''),
(545, 'Meliá Atlanterra', -6.29026, 36.5299, 'Bahía de la Plata, s/n', 'Zahara de los Atunes', 'Cádiz', '', 'Spain', '', '', 'melia.atlanterra@melia.com', '', ''),
(546, 'Meliá Barcelona Sarrià', 2.14175, 41.3909, 'Avinguda de Sarrià, 50', ' Barcelona', 'Baleares', '', 'Spain', '', '', 'melia.barcelona.sarria@melia.com', '', ''),
(547, 'Meliá Barcelona Sky', 2.19871, 41.4062, 'Pere IV, 272-286', 'Barcelona ', 'Barcelona', '', 'Spain', '', '', 'melia.sky@melia.com', '', ''),
(548, 'Meliá Benidorm', -0.10437, 38.5405, 'Avenida Severo Ochoa, 1', 'Benidorm ', 'Alicante', '', 'Spain', '', '', 'melia.benidorm@melia.com', '', ''),
(549, 'Meliá Bilbao', -2.94181, 43.2675, 'LEHENDAKARI LEIZAOLA 29', ' Bilbao ', 'Vizacaya', '', 'Spain', '', '', 'melia.bilbao@melia.com', '', ''),
(550, 'Meliá Calviá Beach', 2.53324, 39.5031, 'Calle Violeta, 1', ' Mallorca Illes Balears', 'Baleares', '', 'Spain', '', '', 'melia.calvia.beach@melia.com', '', ''),
(551, 'Meliá Costa del Sol', -4.49584, 36.6209, 'Paseo Marítimo, 11', 'Torremolinos', 'Málaga', '', 'Spain', '', '', 'melia.costasol@melia.com', '', ''),
(552, 'Meliá Fuerteventura & Sol Beach House at Meliá Fuerteventura', -14.2111, 28.2081, 'Playa Barca, s/n', 'Pájara', 'Las Palmas', '', 'Spain', '', '', 'melia.fuerteventura@melia.com', '', ''),
(553, 'Meliá Hacienda del Conde', -16.2785, 28.4706, 'Paseo Severiano Ballesteros, s/n', 'Buenavista del Norte', 'Santa Cruz de Tenerife', '', 'Spain', '', '', 'melia.haciendadelconde@melia.com', '', ''),
(554, 'Meliá Lebreros', -5.97829, 37.385, 'Luis de Morales, 2', 'Sevilla ', 'Sevilla', '', 'Spain', '', '', 'david.urbanos@melia.com', '', ''),
(555, 'Meliá Madrid Princesa', -3.71633, 40.4272, 'Calle de la Princesa, 27', 'Madrid ', 'Madrid', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/madrid/melia-madrid-princesa/index.html', 'melia.madrid.princesa@melia.com', '', ''),
(556, 'Meliá Madrid Serrano', -3.68552, 40.4354, 'C/ Claudio Coello, 139', 'Madrid', 'Madrid', '', 'Spain', '', '', 'marta.rubio@melia.com', '', ''),
(557, 'Meliá Marbella Banús', -4.94796, 36.4952, 'C/ Mario Vargas Llosa, s/n', 'Marbella', 'Málaga', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/marbella/melia-marbella-banus/index.htm', 'melia.marbella.banus@melia.com', '', ''),
(558, 'Meliá Palma Bay', 2.66369, 39.5635, 'Carrer de Felicià Fuster, 4', ' Mallorca ', 'Baleares', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/majorca/melia-palma-bay/index.htm', 'melia.palma.bay@melia.com', '', ''),
(559, 'Meliá Palma Marina', 2.62802, 39.5647, 'Paseo Ingeniero Gabriel Roca, 29', ' Mallorca ', 'Baleares', '', 'Spain', '', '', 'melia.palma.marina@melia.com', '', ''),
(560, 'Meliá Sitges', 1.82179, 41.2367, 'Joan Salvat Papasseit, 38', 'Sitges', 'Barcelona', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/sitges/melia-sitges/index.htm', 'melia.sitges@melia.com', '', ''),
(561, 'Meliá South Beach', 2.53224, 39.5046, 'Avenida Notario Alemany, 1', 'Magaluf', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/me-mallorca/index.html', 'memallorca@melia.com', '', ''),
(562, 'Meliá Tamarindos', -15.4128, 28.1001, 'Retama, 3', 'Playa de San Agustín', 'Las Palmas', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/gran-canaria/melia-tamarindos/index.htm', 'melia.tamarindos@melia.com', '', ''),
(563, 'Meliá Villaitana', -0.14911, 38.5592, 'Avenida Alcalde Eduardo Zaplana, 7', 'Benidorm', 'Alicante', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/alicante/melia-villaitana/index.htm', 'cristina.rebner@melia.com', '', ''),
(564, 'Meliá Zaragoza', -0.88589, 41.6516, 'Avenida Cesar Augusto, 13', 'Zaragoza', 'Zaragoza', '', 'Spain', '', '', 'maria.rubio@melia.com', '', ''),
(565, 'Palacio de los Duques, a Gran Meliá Hotel', -3.71184, 40.4197, 'Cuesta de Santo Domingo, 5 y 7', 'Madrid ', 'Madrid', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/madrid/gran-melia-palacio-de-los-duques/index.htm', 'gmpalacio@melia.com', '', ''),
(566, 'Sol Barbados', 2.53281, 39.5027, 'Avenida Notario Alemany, 7', 'Calviá', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/sol-barbados/index.html', 'sol.barbados@melia.com', '', ''),
(567, 'Sol Beach House Mallorca', 2.53812, 39.5139, 'Carrer Duc Estremera, 16', 'Calviá', 'Baleares', '', 'Spain', '', 'https://www.melia.com/en/hotels/spain/majorca/sol-cala-blanca/index.html', 'sol.beach.house.mallorca@melia.com', '', ''),
(568, 'Sol Beach House Menorca', 4.03939, 39.9158, 'Playa de Santo Tomás, s/n', 'Menorca ', 'Baleares', '', 'Spain', '', 'https://www.melia.com/es/hoteles/espana/menorca/sol-beach-house-menorca/actividades.html', 'sol.beach.house.menorca@melia.com', '', ''),
(569, 'Sol Guadalupe', 2.53113, 39.5056, 'Crta. La Porrasa, 4', 'Calviá', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/sol-house-guadalupe/index.html', 'sol.guadalupe@melia.com', '', ''),
(570, 'Sol House Studio - Calviá Beach', 2.53757, 39.5124, 'C/ Blanca, 2', 'Calviá', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/sol-house-trinidad/index.html', 'sol.house.mallorca@melia.com', '', ''),
(571, 'Sol Katmandu Park & Resort', 2.53198, 39.5102, 'Calle Galeón, s/n', 'Calviá', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/sol-katmandu-park-and-resort/index.html', 'sol.katmandu.resort@melia.com', '', ''),
(572, 'Sol Katmandu Park & Resort', 2.53198, 39.5102, 'Calle Galeón, s/n', 'Calviá', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/sol-katmandu-park-and-resort/index.html', 'sol.katmandu.resort@melia.com', '', ''),
(573, 'Sol Palmanova - Mallorca', 2.54241, 39.5449, 'Pinzones, s/n', 'Palmanova', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/sol-palmanova-mirlos-tordos/index.html', 'sol.palmanova@melia.com', '', ''),
(574, 'Sol Wave House', 2.53411, 39.5076, 'Avenida Magalluf, 18', 'Calviá', 'Baleares', '', 'Spain', '', 'http://www.melia.com/en/hotels/spain/majorca/sol-wave-house/index.html', 'sol.wave.house@melia.com', '', ''),
(600, 'Apartamento Mirador de la Luna', -2.71963, 38.2176, 'C/ San Bartolomé, s/n', 'Hornos', 'Jaén', 'Andalucía', 'España', '953 496 163', 'www.lalunarural.es', 'reservas@lalunarural.es', 'https://lalunarural.es/sites/default/files/styles/alto600/public/001131399327047.jpg?itok=pw1hKkX4', 'La Luna Turismo Rural ofrece a sus visitantes un maravilloso alojamiento rural en Hornos, situado en el centro del Parque Natural Sierras de Cazorla, Segura y las Villas - Jaén - Andalucia'),
(601, 'Apartamentos Cal Carter', 1.97619, 41.6995, 'Pl. Tomàs Viver, 1', 'Mura', 'Barcelona', 'Cataluña', 'España', '938 317 036', 'www.calcarter.es', 'apartaments@calcarter.es', 'http://www.calcarter.es/img/CC1.jpg', 'Para poder disfrutar de una estancia en nuestro pueblo ofrecemos apartamentos para 2, 4 y 6 personas, y también habitacion para 2 personas, situados dentro el pueblo.'),
(602, 'Area Camper Massís del Montgrí', 3.09741, 42.0762, 'camí vell d\'Ulla, 21', 'Bellcaire d\'Empordà', 'Girona', 'Cataluña', 'España', '633 436 314', 'https://massisdelmontgri.cat/es/', 'info@massisdelmontgri.cat', 'https://massisdelmontgri.cat/images/fotos-area/foto1.jpg', 'El aula de naturaleza Ermita Vieja está situada en el espacio protegido de Sierra Nevada, cerca de Dílar, a 18 km. de la ciudad de Granada, en un valle frondoso, rodeada de nogales, huertas tradicionales y pinares. Acompañada por el sonido constante y fiel del río, el aula atiende la llegada de niños, niñas, jóvenes, adultos… que quieren conocer, disfrutar de este entorno y aprender a respetar el medio ambiente. Es un edificio rústico de nueva construcción  acondicionado para albergar a grupos en habitaciones múltiples; con amplias salas y talleres para desarrollar cómodamente los diferentes programas de trabajo, la biblioteca con la chimenea nos invita al final del día a conversar relajadamente al calor del fuego, a contar historias o a divertirnos con juegos y danzas, música, teatro…'),
(603, 'Aula de Naturaleza Ermita Vieja', -3.5614, 37.0629, 'Apdo. Correos 776', 'Dilar', ' Granada', 'Andalucía', 'España', '958 228 496', 'www.huertoalegre.com', 'roser@huertoalegre.com', 'https://www.huertoalegre.com/wp-content/uploads/2020/02/p_patio3p.jpg', 'Las actividades las realizaremos en Ermita Vieja, un edificio rústico de nueva construcción  situado en el parque natural de Sierra Nevada rodeado de nogales, pinares y el ruido constante y fiel del río Dílar. Un lugar que nos permite ofrecer una amplia gama de propuestas tanto en los espacios interiores como en el entorno del espacio protegido, para que cada persona elija aquellas con las que se siente más identificada.'),
(604, 'Barraca Vilbor', 0.718289, 40.7063, 'Sant Jaume d\'enveja', 'Sant Jaume d\'enveja', 'Tarragona', 'Cataluña', 'España', '633 778 593', 'https://casesdeltaebre.com/es/', 'barracavilbor@gmail.com', 'https://casesdeltaebre.com/wp-content/uploads/2018/10/Casetes.jpeg', 'Nuestros alojamientos están situados en el centro del Delta del Ebro, todos dentro del término municipal de San Jaume d’Enveja. El entorno es de arrozales y naturaleza en estado puro. Las casas están bien acondicionadas y son perfectas para una estancia memorable en el Delta. Cada una de las casas es excelente para explorar los paisajes deltaicos, realizar actividades en la naturaleza, rutas en bicicleta y disfrutar de las playas casi desiertas. Encontrará mucha tranquilidad, espacios donde poder desconectar y descansar.'),
(605, 'Camping La Aldea', -6.48474, 37.1307, 'Ctra. del Rocío Km 25 ', 'El Rocío', 'Huelva', 'Huelva', 'España', '687 987 633', 'www.campinglaaldea.com', 'info@campinglaaldea.com', 'https://campinglaaldea.com/wp-content/uploads/2020/05/choza-marismena-9.jpg', 'Situado en la aldea de El Rocío, a las puertas de Doñana, el espacio nacional y natural protegido más importante de Europa, el Camping La Aldea se configura como un lugar perfecto para disfrutar de unas vacaciones en plena naturaleza.'),
(606, 'Camping Ons', -8.78552, 42.3211, 'Ramón Bares, 45', 'Bueu', 'Pontevedra', 'Galicia', 'España', '986 229 235', 'www.campingisladeons.com', 'susuions@isladeons.net', 'https://www.campingisladeons.com/wp-content/uploads/2019/02/Camping-Ons-23-4.jpg', 'El Camping Isla de Ons está en el Parque Nacional das Illas Atlánticas de Galicia, un paraje espectacular rodeado de naturaleza y de playas de arena blanca, de una gran gastronomía y increíbles tradiciones.'),
(607, 'Casa de Gloria', -2.9954, 37.0308, 'Calle Ancha, 9', 'Bayárcal', 'Almeria', 'Andalucía', 'España', '950 343 919', 'www.lacasadegloria.es', 'lopezgloria@gmail.com', 'http://www.lacasadegloria.es/mediapool/122/1225414/resources/29030846.JPG', 'Bienvenidos a La Casa de Gloria, La Alpujarra.'),
(608, 'Casa Diversa-touristic services', -17.1883, 28.1702, 'C/Los Gomeros,12', 'Hermigua ', 'Santa Cruz de Tenerife ', '', 'España', '660 921 809', 'www.casadiversa.com ', 'casadiversa@hotmail.com', 'http://www.casadiversa.com/resCache/site13582/res615873_fit_398x356_0MC0x399x8380x9968x2.jpg', 'Sea nuestro huésped en Casa Diversa. Le ofrecemos alojamiento totalmente equipados. Apartamentos tipo estudio y pisos en La Gomera y apartamentos y casas (algunas con piscina privada) en El Hierro. Disfrute durante sus vacaciones en las Islas Canarias más auténticas, de sus vistas maravillosas vistas y paisajes. '),
(609, 'Casa rural Abuela María', -4.36723, 39.2582, 'Ronda de la Vega, 20', 'Santa Quiteria', 'Ciudad Real', 'Castilla-La Mancha', 'España', '666 202 139', 'www.abuelamaria.es', 'info@abuelamaria.es', 'http://www.hgsitebuilder.com/files/writeable/uploads/hostgator543123/image/patio-1.jpg', 'Casa rural catalogada con 3 espigas, máxima categoria que otorga Turismo en Castilla la Mancha. Compuesta por Salón con cocina, hogar de leña y 2 habitaciones con baño. Exposición de fotografia de naturaleza salvaje de Cabañeros y entorno.'),
(610, 'Casa Rural Don Jaime', -4.25646, 39.3035, 'Calle Panaderos, 1', 'Pueblo Nuevo del Bullaque', 'Ciudad Real', 'Castilla-La Mancha', 'España', '695 014 831', 'www.casaruraldonjaime.com', 'info.casaruraldonjaime@gmail.com', 'http://www.casaruraldonjaime.com/assets/images/101703363-3384662101579059-243750127171272704-o-576x432.jpg', 'Casa rural Don Jaime, es un alojamiento formado por dos viviendas : Don Jaime I y Don Jaime II ambos situados en un entorno unico, Pueblonuevo del Bullaque  en pleno corazón del Parque Nacional de Cabañeros.'),
(611, 'Casa rural El Olivar del Puerto', -4.6501, 39.3264, 'C/ Real, 59', 'Horcajo de los Montes', 'Ciudad Real', 'Castilla-La Mancha', 'España', '607 526 555', 'www.elolivardelpuerto.com', 'casarural@elolivardelpuerto.com', 'https://images.trvl-media.com/hotels/34000000/33220000/33212800/33212714/1aada4c4_b.jpg', 'En pleno Parque Nacional de Cabañeros, nuestro alojamiento se caracteriza por estar construido sobre un viejo olivar que aún se conserva y da nombre a la casa. Hemos hecho posible la perfecta armonía entre lo rústico de antaño, con el conford y la comodidad más exquisita de nuestros días. Debido a su elevada situación, se pueden contemplar magnificas vistas del pueblo y del Parque Nacional.'),
(612, 'CORTIJO EL CAMPILLO', -2.09614, 36.8598, 'El Campillo de Doña Francisca', 'Los Albaricoques', 'Almería', 'Andalucía', 'España', '950 525 779', 'www.elcampillo.info', 'annika@elcampillo.info', 'https://www.elcampillo.info/assets/habitaciones10.jpg', ' El Cortijo El Campillo es una casa rural ecológica en el Parque Natural de Cabo de Gata-Níjar. Este cortijo de más de cien años de edad conserva su arquitectura tradicional, a la que se han incorporado las comodidades modernas para disfrutar de unas agradables vacaciones en plena naturaleza.'),
(613, 'CORTIJO LOS MALENOS', -1.93403, 36.9399, 'Agua Amarga', 'Níjar', 'Almería', 'Andalucía', 'España', '618 286 260', 'www.cortijolosmalenos.com', 'contactar@cortijolosmalenos.com', 'https://www.cortijolosmalenos.com/wp-content/uploads/2019/03/Cortijo-los-malenos-exterior2.jpg', 'El Cortijo los Malenos es un alojamiento con encanto en el Cabo de Gata, concretamente en la zona de Agua Amarga y junto al Parque Natural del Cabo de Gata Níjar. El Cortijo los Malenos es un casa rural en Cabo de Gata, Almería, en el que disponemos de diversidad de habitaciones, salas comunes, patios, jardines y piscina. Un alojamiento rural perfecto para relajarse. '),
(614, 'El Boquerón de Estena', -4.52101, 39.4944, 'Camino del río, km. 1,5', 'Navas de Estena', 'Ciudad Real', 'Castilla-La Mancha', 'España', '689 125 108', 'www.boquerondestena.com', 'boquerondestena@boquerondestena.com', 'http://www.boquerondestena.com/bde/wp-content/uploads/2011/07/P2-304_Fotograf%C3%ADa_baja-31-400x264-350x231.jpg', 'La casa rural Boquerón de Estena se localiza en el corazón del Parque Nacional de Cabañeros, a las afueras del pueblo de Navas de Estena (Ciudad Real), cerca de Toledo y de Madrid. Se accede a ella a través de una vía bien acondicionada para paso de vehículos.'),
(615, 'El Descansillo', -2.02661, 40.7704, 'C/ Valhermoso, 4', 'Escalera', 'Guadalajara', 'Castilla-La Mancha', 'España', '949 831 252', 'www.eldescansillo.net', 'informacion@eldescansillo.net', 'http://www.eldescansillo.com/wp-content/uploads/2017/03/s1.jpg', 'El pueblo de Escalera está situado en un pequeño altozano que domina un paisaje suavemente ondulado que abruptamente termina en los escarpes del río Bullones.'),
(616, 'Hacienda Olontigi', -6.24709, 37.303, 'C/ Ventorro, 23', 'Aznalcázar', 'Sevilla', 'Andalucía', 'España', '955 751 976', 'www.olont.com', 'recepcion@olont.com', 'http://hacienda-olontigi.com/wp-content/uploads/2015/04/farola3-585x277.png', 'Construida en un antiguo corralón de pueblo, antiguo lugar de cría de ganado y caballos, siguiendo los parámetros del estilo tradicional andaluz, Hacienda Olontigi es una magnífica Casa Rural de Categoría Superior en la que los amantes del turismo rural y aquellos que deseen un contacto más familiar y cercano disfrutarán de una agradable estancia.'),
(617, 'Hostal Arenal SL', -5.08191, 40.2679, 'C/Carretera de Mombeltran, 23', 'El Arenal', 'Ávila', 'Castilla y León', 'España', '647 543 675', 'www.hotelrurallosmolinillos.com', 'losmolinillos@gmail.com', 'https://www.hotelrurallosmolinillos.com/public/images/sites/2118-114426.jpg', 'En el Hotel Rural Los Molinillos ofrecemos a nuestros huéspedes pasar unos días en un Espacio Natural Protegido como es el Parque Regional Sierra de Gredos, rodeado de naturaleza donde disfrutar del entorno y de multitud de actividades al aire libre.'),
(618, 'Hostal Restaurante Labella', -3.0633, 37.1783, 'Carretera de Aldeire, 1', 'La Calahorra', 'Granada', 'Andalucía', 'España', '958 677 000', 'https://www.hostallabella.com/', 'labellahrr@gmail.com', 'https://www.hostallabella.com/sites/default/files/styles/dossier/public/page/17/terraza-h-108.jpg?itok=34cYFZM2', 'Hotel Labella, un pequeño hotel familiar. contamos con 11 habitaciones con unas maravillosas vistas del Palacio-fortaleza de La Calahorra y el Espacio Natural de Sierra Nevada.'),
(619, 'Hotel Borrel', 2.48186, 42.1909, 'Calle Nonet Escubos, 8', 'Olot', 'Girona', 'Cataluña', 'España', '972 27 61 61', 'https://www.hotelborrell.com/', 'info@hotelborrell.com', 'https://www.hotelborrell.com/wp-content/uploads/2014/05/recepcio-hotel-borrell-olot_banner.jpg', 'Nos encontramos situados en el corazón de Olot, formando parte del paisaje urbano de la ciudad y en el marco de la Zona Volcánica de la Garrotxa. A un paso del centro histórico, comercial y gastronómico de la ciudad, ya 50 metros de la Vía Verde Olot - Girona, buen punto de partida para rutas de senderismo y cicloturismo.'),
(620, 'Hotel Don Cándido', 2.0086, 41.5506, 'Rambleta Pare Alegre, 98', 'Terrassa', 'Barcelona', 'Cataluña', 'España', '937 333 300', 'www.hoteldoncandido.com', 'info@hoteldoncandido.com', 'http://www.hoteldoncandido.com/cache/files/Imatges/W1920H0N_MG_0365-1.jpg', 'El Cándido Hotel se ha convertido en un hotel de referencia en la zona del Vallés y presenta un diseño circular poco habitual que ofrece una iluminación perfecta en todas las habitaciones. El establecimiento alberga un spa y ofrece habitaciones elegantes de diseño.  El hotel Don Cándido está situado en Terrassa, a 25 minutos en coche de Barcelona y del aeropuerto internacional El Prat. El circuito de Cataluña, en Montmeló, queda a 20 minutos en coche.'),
(621, 'Hotel Perla d\'Olot', 2.47907, 42.169, 'Ctra. De la Deu, 9', 'Olot', 'Girona', 'Cataluña', 'España', '', 'www.laperlahotels.com', 'info@laperlahotels.com', 'https://www.hotellaperlaolot.com/wp-content/uploads/2019/01/parc-infantil.jpg', 'El Hotel La Perla Olot es un alojamiento ubicado en la capital de la comarca de La Garrotxa. Buscas un hotel en Olot? Gracias a su privilegiada ubicación es ideal para iniciar rutas de senderismo o cicloturismo para descubrir el Parque Natural de la Zona Volcánica de la Garrotxa, La Fageda d\'en Jordà, los volcanes de Olot, el volcán Santa Margarita, el volcán Croscat, las Vías Verdes y los pueblos rurales de Santa Pau, Vall d\'en Bas o Besalú. Somos un hotel familiar, con un equipo de personas a su servicio, los equipamientos - restaurante, cafetería, terraza, jardín - dentro de un mismo complejo, están a su disposición preparados para que pueda disfrutar de una estancia a su medida.'),
(622, 'Hotel SPA Sierra de Cazorla', -2.99157, 37.9221, 'Ctra. de la Sierra, s/n', 'La Iruela', 'Jaén', 'Andalucía', 'España', '953 720 015', 'www.hotelsierradecazorla.com', 'info@hotelsierradecazorla.com', 'https://lh3.googleusercontent.com/VHOIH5tZQgdU2rYU0QH26yQaaK0_s4M_tfXKWHVRbAz1AxaKIAAhrnaXu0MwUmGNfAiqIqumYgowlR_2xe_yVaM=s400', 'El complejo, ambiental y energéticamente sostenible, está compuesto por un Hotel de 3 estrellas (Hotel Sierra de Cazorla & SPA 3*), un Hotel de 4 estrellas (Hotel & SPA Sierra de Cazorla 4*) y un Centro Termal (SPA ÓLEO SALUD) para uso de los clientes de ambos hoteles, además de los servicios comunes como recepción, salones, cafetería, restaurantes, gimnasio gratuito, parking y piscina exterior (abierta en temporada de verano). También incluye un edificio de apartamentos a corta distancia del complejo.'),
(623, 'Hotel Zuhayra', -4.31527, 37.5443, 'C/ Mirador, 10', 'Zuheros', 'Córdoba', 'Andalucía', 'España', '957 694 693', 'https://zercahoteles.com/', 'hotelzuhayra@zercahoteles.com', 'https://zercahoteles.com/wp-content/uploads/2018/09/2B5A2285-HDR.jpg', 'Pequeño hotel rural situado en Zuheros, pequeño pueblo blanco de 700 habitantes considerado como uno de los pueblos más bonitos de España. En pleno Parque Natural y Geoparque Sierras Subbéticas y junto a la Vía Verde del Aceite, lo que lo convierte en base ideal para pasar unos días de descanso lejos de la rutina cotidiana disfrutando de un inmejorable entorno natural.'),
(624, 'La Almunia del Valle ', -3.53193, 37.1192, 'Camino de la Umbría, s/n.', 'Monachil', 'Granada', 'Andalucía', 'España', '958 308 010', 'www.laalmuniadelvalle.com', 'info@laalmuniadelvalle.com', 'https://www.laalmuniadelvalle.com/wp-content/uploads/2016/09/FACHADA-ORIGINAL-DEL-HOTEL-639x426.jpg', 'La Almunia del Valle es un pequeño boutique hotel con encanto situado en el parque de Sierra Nevada uno de los parajes naturales más bellos de Granada. Autenticidad y armonía definen a este singular boutique hotel. Tradición en un ambiente cosmopolita. Un oasis sostenible para el viajero que descubre Andalucía.'),
(625, 'Los Telares', -17.1978, 28.1553, 'Carretera General, 10', 'Hermigua', 'Santa Cruz de Tenerife', '', 'España', '922 880 781', 'www.apartamentosgomera.com', 'info@apartamentosgomera.com', 'https://lagomera.apartments/wp-content/uploads/sites/8/2019/11/CasaElPatio-barrio1.jpg', 'Estos apartamentos de estilo canario están situados en la pintoresca isla de la Gomera y son perfectos para disfrutar de la naturaleza y realizar actividades al aire libre en un entorno magnífico. El establecimiento tiene una piscina. Los Apartamentos Los Telares se encuentran en el valle de Hermigua, cerca del antiguo convento de Santo Domingo, en el centro de la localidad. Además, gozan de vistas espectaculares a la isla.'),
(626, 'Miraltajo', -1.98036, 40.8443, 'C/ Eras del Río, s/n', 'Corduente', 'Guadalajara', 'Castilla-La Mancha', 'España', '949 832 030', 'www.miraltajo.com', 'reservas@miraltajo.com', 'http://www.miraltajo.com/foto/2.jpg', 'Es un Alojamiento Rural de 6 apartamentos de nueva construcción sobre una finca independiente de unos 4.000 m2, realizada con materiales tradicionales (piedra arenisca, ladrillo de era, madera, etc.), con el fin de incorporarse al entorno natural de la zona. Conjuga la construcción tradicional con las comodidades de hoy en día. Dispone de grandes espacios exteriores con barbacoas, fuente, mesas, columpios y aparcamiento. También se ofrecen bicicletas para nuestros clientes.'),
(627, 'Parador de Turismo Cazorla', -2.96214, 37.9035, 'Ctra. Sierra s/n', 'Cazorla', 'Jaén', 'Andalucía', 'España', '953 707 075', 'www.parador.es', 'cazorla@parador.es', 'https://www.parador.es/sites/default/files/styles/900x900/public/galerias/img/2013/08/exterior_01_36.jpg?itok=tiZPWO_y', 'En el corazón del Parque Natural de las Sierras de Cazorla, Segura y Las Villas, en el paraje conocido como Sacejo, se ubica el Parador de Cazorla, un remanso de paz en plena naturaleza. Su altitud hace que las panorámicas de laderas repletas de pinos sean inmejorables. Tan solo el ruido de los pájaros interrumpirá tu descanso en la piscina o los paseos por los alrededores del hotel. La atmósfera de tranquilidad y la belleza de enclaves cercanos como la Cañada de las Fuentes, o el salto de Linarejos, los convierte en tu centro de encuentro ideal si te fascina la naturaleza.'),
(628, 'Pensión Guerrero S.L.L.', -4.43994, 37.4722, 'C/ Pepita Jiménez, 7', 'Cabra', 'Córdoba', 'Andalucía', 'España', '957 520 507', 'www.actiweb.es/pensionguerrero/', 'pensionguerrero_s.l.l@hotmail.com ', 'http://www.actiweb.es/pensionguerrero/imagen46.jpg?1210161344', 'Ubicado en el Parque Natural - Sierras Subbéticas. Enclavado en el casco urbano de Cabra (Córdoba), frente al prestigioso Instituto Aguilar y Eslavay la Iglesia los Remedios. Junto al Paseo Alcántara Romero y la Plaza de Toros. Disponemos de servicio de cama y comida casera y con trato familiar. Enmarcado dentro de distintas rutas de interés, como Vía Verde, Camino mozárabe de Santiago, Sendero de Gran Recorrido (GR-7), Ruta Vida Sana 10000pasos, Ruta del Califato, etc.'),
(629, 'VTAR Los Arrayanes', -5.1623, 36.7425, 'Plaza de la Oscuridad 6, 7 y 8', 'Ronda', 'Malaga', 'Andalucía', 'España', '914 514 138', 'https://www.los-arrayanes.com/', 'los_arrayanes2006@yahoo.es', 'https://www.los-arrayanes.com/wp-content/uploads/exterior_apartamentos.jpg', 'Los Apartamentos turísticos Los Arrayanes le ofrecen la oportunidad de disfrutar de una escapada con encanto en un entorno especial, único y genuino.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `CATID` int NOT NULL COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 categorías',
  `NOMBRE` varchar(128) NOT NULL COMMENT 'Nombre de la categoría de búsqueda. Obligatorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena las categorías para búsquedas';

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`CATID`, `NOMBRE`) VALUES
(1, 'Gestión ambiental'),
(2, 'Ecoturismo'),
(3, 'Agroturismo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificados`
--

CREATE TABLE `certificados` (
  `CERTID` int NOT NULL COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 certificados',
  `NOMBRE` varchar(128) NOT NULL COMMENT 'Nombre del certificado. Obligatorio',
  `WEBSITE` varchar(255) DEFAULT NULL COMMENT 'Url del sitio web de la entidad certificadora. Opcional',
  `DESCRIPCION` text COMMENT 'Texto descriptivo de las características del certificado. Opcional',
  `ORGANISMO` varchar(255) DEFAULT NULL COMMENT 'Nombre del organismo o entidad certificadora. Obligatorio',
  `LOGO` varchar(255) DEFAULT NULL COMMENT 'Ruta al archivo del logo del certificado en el servidor. Opcional',
  `ETIQUETA` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los certificados de los que se hace seguimiento en la aplicación';

--
-- Volcado de datos para la tabla `certificados`
--

INSERT INTO `certificados` (`CERTID`, `NOMBRE`, `WEBSITE`, `DESCRIPCION`, `ORGANISMO`, `LOGO`, `ETIQUETA`) VALUES
(1, 'Certificación Biosphere', 'https://www.biospheretourism.com/en', 'Biosphere es una certificación turística diseñada para la industria turística. Incorpora los 17 Objetivos de Desarrollo Sostenible de Naciones Unidas y las directrices emanadas de la Cumbre del Clima de París. Los estándares de certificación están relacionados con los ambitos: 1. Medio ambiente (ODS 7. Energía asequible y no contaminante, ODS 13. Acción por el clima) 2. Social (ODS 6. Agua limpia y saneamiento, ODS 12. Producción y consumo responsables, ODS 14. Vida submarina, ODS 15. Vida de ecosistemas terrestres) 3. Economía (ODS 1. Fin de la pobreza, ODS 3. Salud y Bienestar, ODS 4. Educación de calidad, ODS 5. Igualdad de Género, ODS 10. Reducción de las desigualdades, ODS 17. Alianzas para lograr los objetivos 4. Economía (ODS 2. Hambre cero, ODS 8. Trabajo decente y crecimiento económico, ODS 9. Industria, Innovación e Infraestructura) 5. Cultura (ODS 11. Ciudades y comunidades sostenibles, ODS 16. Paz, Justicia e Instituciones sólidas)', ' Instituto  de  Turismo  Responsable  (ITR).', 'https://www.biospheretourism.com/assets/img/bio2/logo-biosphere-header.svg', 'Biosphere Tourism'),
(2, ' ECEAT QUALITY LABEL ', 'http://www.eceat.org/', 'ECEAT (European Centre for Ecological and Agricultural Tourism) es la organización líder a nivel europeo en el campo del turismo sostenible en pequeña escala. Presta una atención especial a las zonas rurales y la agricultura orgánica. Es un sistema de calidad ecológico europeo, bajo criterios de sostenibilidad que miden el nivel de compromiso medioambiental, socio-cultural y económico con el destino, en base a cuatro criterios: 1. Agricultura sostenible: Promover el cultivo ecológico y la biodiversidad agrícola con productos autóctonos. Contribución activa en materia de agricultura sostenible. Ofrecer una gastronomía de calidad basada en alimentos de proximidad, de temporada y naturales. 2. Patrimonio cultural: Sensibilidad y aprecio con respecto a las tradiciones y culturas locales y su conservación. Contribución activa en el desarrollo sostenible de la economía local. 3. Protección de la naturaleza: Respeto con el entorno que le rodea y promoción de actividades de concienciación y/o educación medioambiental 4. Recursos naturales: Gestión de los recursos naturales, tratamiento de residuos, y ahorro energético.', 'European Centre for Ecological\r and Agricultural Tourism ', 'https://greendestinations.org/wp-content/uploads/2019/04/eceat-280x300.png', 'Eceat Rural Tourism'),
(3, 'Certificación Green Globe 21', 'https://greenglobe.com/', 'Green Globe es un sistema de certificación en sostenibilidad que ha sido desarrollado exclusivamente para la industria del turismo. Sus criterios de sostenibilidad se basan en los criterios globales de turismo sostenible: A. Demostrar una gestión sostenible eficaz. B. Maximizar los beneficios sociales y económicos para la comunidad local y minimizar los impactos negativos. C. Maximizar los beneficios para el patrimonio cultural y minimizar los impactos negativos. D. Maximizar los beneficios para el medio ambiente y minimizar los impactos negativos.', 'Green Globe', 'https://greenglobe.com/wp-content/uploads/2014/10/green-globe-logo-120.png', 'Green Globe 21'),
(4, 'ECOLABEL UE; Catálogo de Alojamientos Turísticos ', 'http://ec.europa.eu/ecat/hotels-campsites/en', 'La Etiqueta Ecológica de la UE es una certificación destinada a promover productos y servicios que tienen un impacto ambiental reducido durante todo su ciclo de vida.  Los alojamientos certificados cumplen los criterios obligatorios para los ámbitos de 1. Energía 2. Agua 3. Gestión 4. Residuos 5. Información a los clientes además de un mínimo de otros criterios voluntarios', 'Unión Europea', 'http://ec.europa.eu/ecat/images/ecolabel-logo.gif', 'Ecolabel UE'),
(5, 'EarthCheck', 'https://earthcheck.org/', ' EarthCheck es una certificación diseñada para la industria de viajes y turismo,  construida en los principios de la Agenda 21 de Desarrollo Sostenible. El programa requiere que los negocios midan, monitoreen y realice continuas mejoras en las áreas clave de rendimiento detalladas a continuación:  1.Emisiones de Efecto Invernadero 2.Eficiencia Energética, Conservación & Gestión  3.Gestión de Recursos de Agua Dulce 4.Conservación y Gestión de Ecosistemas 5.Gestión Social y Cultural  6.Planificación y Gestión del Uso de la Tierra 7.Protección de la Calidad del Aire 8.Gestión de Aguas Residuales 9.Gestión de Desechos Solidos 10.Sustancias Nocivas para el Medio Ambiente ', 'EarthCheck Pty Limited ', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/EC_large_Word.png/300px-EC_large_Word.png', 'Earth Check'),
(6, 'Carta Europea Turismo Sostenible', 'http://www.redeuroparc.org/actividades/carta-europea-turismo-sostenible', 'La Carta Europea de Turismo Sostenible en Espacios Naturales Protegidos (CETS) es una iniciativa de la Federación EUROPARC que tiene como objetivo global promover el desarrollo del turismo en clave de sostenibilidad en los espacios naturales protegidos de Europa. La empresa turística adherida a la Carta Europea de Turismo Sostenible cumple: 1. Está ubicada en el ámbito del espacio natural protegido acreditado 2. Cumple la legislación vigente que le sea de aplicación (licencias, autorización para el desarrollo de la actividad..) 3. Las actividades de la empresa turística deberán ser compatibles con la estrategia de turismo sostenible y la normativa del espacio protegido 4. La empresa ha de formar parte del Foro de Turismo Sostenible creado en cada espacionatural protegido en el marco de la Carta Europea de Turismo Sostenible', 'EUROPARC ESPAÑA', 'http://www.redeuroparc.org/system/files/shared/logo-europarc.png', 'Europarc Turismo Sostenible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `EXT_USRID` int NOT NULL COMMENT 'Clave del usuario. Obligatorio',
  `EXT_ALID` int NOT NULL COMMENT 'Clave del establecimiento seleccionado como favorito por el usuario. Obligatorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena las asignaciones de alojamientos como favoritos para los usuarios';

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`EXT_USRID`, `EXT_ALID`) VALUES
(1, 101),
(1, 206),
(1, 213);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `EXT_USRID` int NOT NULL COMMENT 'Clave externa correspondiente a la clave primaria de la tabla de usuarios',
  `PERFIL` enum('registrado','oauth') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Se asignan dos perfiles, uno para los usuarios registrados y otro para los que acceden mediante OAuth',
  `PASS` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Contraseña como cadena encriptada en backend para los perfiles registrados'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de los perfiles de los usuarios tanto registrados como de OAuth';

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`EXT_USRID`, `PERFIL`, `PASS`) VALUES
(1, 'registrado', '$2b$10$lzth4KSnSCneBStQYeW2Huv99KpCbatWTYu/rvAu79lSIPYdL5.0q'),
(9, 'registrado', '$2b$10$aHJ8NgOcbNXyA7gKouDZ1evfdOxmMSctHGrISjCvtsmItyOLMIVYa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `TAGID` int NOT NULL COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 tags',
  `NOMBRE` varchar(128) NOT NULL COMMENT 'Nombre del tag de búsqueda. Obligatorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los tags o keywords para búsquedas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `union_alojamientos_certificados`
--

CREATE TABLE `union_alojamientos_certificados` (
  `EXT_ALID` int NOT NULL COMMENT 'Clave del establecimiento. Obligatorio',
  `EXT_CERTID` int NOT NULL COMMENT 'Clave del certificado asignado al establecimiento. Obligatorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de asignaciones de certificados a alojamientos';

--
-- Volcado de datos para la tabla `union_alojamientos_certificados`
--

INSERT INTO `union_alojamientos_certificados` (`EXT_ALID`, `EXT_CERTID`) VALUES
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(200, 2),
(201, 2),
(201, 4),
(202, 2),
(203, 2),
(204, 2),
(205, 2),
(206, 2),
(206, 4),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(217, 2),
(218, 2),
(219, 2),
(220, 2),
(221, 2),
(222, 2),
(223, 2),
(224, 2),
(400, 4),
(401, 4),
(402, 4),
(403, 4),
(404, 4),
(405, 4),
(406, 4),
(407, 4),
(408, 4),
(409, 4),
(410, 4),
(411, 4),
(412, 4),
(413, 4),
(414, 4),
(415, 4),
(416, 4),
(417, 4),
(418, 4),
(419, 4),
(420, 4),
(421, 4),
(422, 4),
(423, 4),
(424, 4),
(425, 4),
(426, 4),
(427, 4),
(429, 4),
(430, 4),
(431, 4),
(433, 4),
(434, 4),
(435, 4),
(436, 4),
(437, 4),
(438, 4),
(439, 4),
(440, 4),
(441, 4),
(442, 4),
(443, 4),
(444, 4),
(445, 4),
(446, 4),
(447, 4),
(448, 4),
(600, 6),
(601, 6),
(602, 6),
(603, 6),
(604, 6),
(605, 6),
(606, 6),
(607, 6),
(608, 6),
(609, 6),
(610, 6),
(611, 6),
(612, 6),
(613, 6),
(614, 6),
(615, 6),
(616, 6),
(617, 6),
(618, 6),
(619, 6),
(620, 6),
(621, 6),
(622, 6),
(623, 6),
(624, 6),
(625, 6),
(626, 6),
(627, 6),
(628, 6),
(629, 6),
(500, 5),
(501, 5),
(502, 5),
(503, 5),
(504, 5),
(505, 5),
(506, 5),
(507, 5),
(508, 5),
(509, 5),
(510, 5),
(511, 5),
(512, 5),
(513, 5),
(514, 5),
(515, 5),
(516, 5),
(517, 5),
(518, 5),
(519, 5),
(520, 5),
(521, 5),
(522, 5),
(523, 5),
(524, 5),
(525, 5),
(526, 5),
(527, 5),
(528, 5),
(529, 5),
(530, 5),
(531, 5),
(532, 5),
(533, 5),
(534, 5),
(535, 5),
(536, 5),
(537, 5),
(538, 5),
(539, 5),
(540, 5),
(541, 5),
(542, 5),
(543, 5),
(544, 5),
(545, 5),
(546, 5),
(547, 5),
(548, 5),
(549, 5),
(550, 5),
(551, 5),
(552, 5),
(553, 5),
(554, 5),
(555, 5),
(556, 5),
(557, 5),
(558, 5),
(559, 5),
(560, 5),
(561, 5),
(562, 5),
(563, 5),
(564, 5),
(565, 5),
(566, 5),
(567, 5),
(568, 5),
(569, 5),
(570, 5),
(571, 5),
(572, 5),
(573, 5),
(574, 5),
(300, 3),
(301, 3),
(302, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `union_alojamientos_tags`
--

CREATE TABLE `union_alojamientos_tags` (
  `EXT_ALID` int NOT NULL COMMENT 'Clave del establecimiento. Obligatorio',
  `EXT_TAGID` int NOT NULL COMMENT 'Clave del tag asignado al establecimiento. Obligatorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena las asignaciones de tags a los alojamientos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `union_certificados_categorias`
--

CREATE TABLE `union_certificados_categorias` (
  `EXT_CERTID` int NOT NULL COMMENT 'Clave del certificado. Obligatorio',
  `EXT_CATID` int NOT NULL COMMENT 'Clave de la categoría a la que pertenece el certificado. Obligatorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena las asignaciones de categorías a los certificados';

--
-- Volcado de datos para la tabla `union_certificados_categorias`
--

INSERT INTO `union_certificados_categorias` (`EXT_CERTID`, `EXT_CATID`) VALUES
(1, 1),
(3, 1),
(5, 1),
(2, 2),
(4, 2),
(6, 2),
(2, 3),
(4, 3),
(6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USRID` int NOT NULL COMMENT 'Clave primaria de la tabla. Acepta hasta 2^32 usuarios',
  `EMAIL` varchar(255) NOT NULL COMMENT 'Nombre de usuario basado en email. Obligatorio',
  `FECHAREGISTRO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de registro del usuario. Puede usarse para comprobar la antigüedad del usuario',
  `FECHANACIMIENTO` date DEFAULT NULL COMMENT 'Fecha de nacimiento del usuario sin hora. Puede emplearse para conocer su edad',
  `GENERO` enum('masculino','femenino','otro') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONFIRMACIONREGISTRO` varchar(128) DEFAULT NULL COMMENT 'Hash de confirmación de operación de registro de nuevo usuario',
  `ONBOARDING` tinyint NOT NULL DEFAULT '1' COMMENT 'Flag para determinar si se presentará el onboarding al usuario en su próximo acceso',
  `PENDINGRESETPASS` varchar(128) DEFAULT NULL COMMENT 'Flag para determinar si el usuario está pendiente de realizar un cambio de contraseña'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los usuarios registrado';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`USRID`, `EMAIL`, `FECHAREGISTRO`, `FECHANACIMIENTO`, `GENERO`, `CONFIRMACIONREGISTRO`, `ONBOARDING`, `PENDINGRESETPASS`) VALUES
(1, 'vagb.chente@gmail.com', '2021-01-04 12:03:45', '1977-11-11', 'masculino', NULL, 0, NULL),
(9, 'marisgarceranb@gmail.com', '2021-01-06 21:43:10', '1977-01-17', 'femenino', NULL, 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`ACTID`);

--
-- Indices de la tabla `alojamientos`
--
ALTER TABLE `alojamientos`
  ADD PRIMARY KEY (`ALID`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CATID`);

--
-- Indices de la tabla `certificados`
--
ALTER TABLE `certificados`
  ADD PRIMARY KEY (`CERTID`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`EXT_USRID`,`EXT_ALID`),
  ADD KEY `EXT_ALID` (`EXT_ALID`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`EXT_USRID`,`PERFIL`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`TAGID`);

--
-- Indices de la tabla `union_alojamientos_certificados`
--
ALTER TABLE `union_alojamientos_certificados`
  ADD KEY `EXT_ALID` (`EXT_ALID`),
  ADD KEY `EXT_CERTID` (`EXT_CERTID`);

--
-- Indices de la tabla `union_alojamientos_tags`
--
ALTER TABLE `union_alojamientos_tags`
  ADD PRIMARY KEY (`EXT_ALID`,`EXT_TAGID`),
  ADD KEY `EXT_TAGID` (`EXT_TAGID`);

--
-- Indices de la tabla `union_certificados_categorias`
--
ALTER TABLE `union_certificados_categorias`
  ADD PRIMARY KEY (`EXT_CERTID`,`EXT_CATID`),
  ADD KEY `EXT_CATID` (`EXT_CATID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USRID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `ACTID` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 actividades', AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `alojamientos`
--
ALTER TABLE `alojamientos`
  MODIFY `ALID` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla. Acepta hasta 2^32 establecimientos', AUTO_INCREMENT=630;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `CATID` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 categorías', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `certificados`
--
ALTER TABLE `certificados`
  MODIFY `CERTID` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 certificados', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `TAGID` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla. Acepta hasta 65535 tags';

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USRID` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla. Acepta hasta 2^32 usuarios', AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`EXT_USRID`) REFERENCES `usuarios` (`USRID`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`EXT_ALID`) REFERENCES `alojamientos` (`ALID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`EXT_USRID`) REFERENCES `usuarios` (`USRID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `union_alojamientos_certificados`
--
ALTER TABLE `union_alojamientos_certificados`
  ADD CONSTRAINT `union_alojamientos_certificados_ibfk_1` FOREIGN KEY (`EXT_ALID`) REFERENCES `alojamientos` (`ALID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `union_alojamientos_certificados_ibfk_2` FOREIGN KEY (`EXT_CERTID`) REFERENCES `certificados` (`CERTID`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Filtros para la tabla `union_alojamientos_tags`
--
ALTER TABLE `union_alojamientos_tags`
  ADD CONSTRAINT `union_alojamientos_tags_ibfk_1` FOREIGN KEY (`EXT_ALID`) REFERENCES `alojamientos` (`ALID`) ON DELETE CASCADE,
  ADD CONSTRAINT `union_alojamientos_tags_ibfk_2` FOREIGN KEY (`EXT_TAGID`) REFERENCES `tags` (`TAGID`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Filtros para la tabla `union_certificados_categorias`
--
ALTER TABLE `union_certificados_categorias`
  ADD CONSTRAINT `union_certificados_categorias_ibfk_1` FOREIGN KEY (`EXT_CERTID`) REFERENCES `certificados` (`CERTID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `union_certificados_categorias_ibfk_2` FOREIGN KEY (`EXT_CATID`) REFERENCES `categorias` (`CATID`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
