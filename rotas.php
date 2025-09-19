<?php

use Pecee\SimpleRouter\SimpleRouter;
use sistema\Nucleo\Helpers;

try {
    SimpleRouter::setDefaultNamespace('sistema\Controlador');

SimpleRouter::get('/','SiteControlador@index');
SimpleRouter::get('/sobre-nos', 'SiteControlador@sobre');
SimpleRouter::get('/post/{id}', 'SiteControlador@post');
SimpleRouter::get('/categoria/{id}', 'SiteControlador@categoria');
SimpleRouter::post('/buscar', 'SiteControlador@buscar');

SimpleRouter::get('/404', 'SiteControlador@erro404');

SimpleRouter::start();

} catch (Pecee\SimpleRouter\Exceptions\NotFoundHttpException $ex) {
    if(Helpers::localhost()){
        echo $ex->getMessage();
    } else {
        Helpers::redirecionar('404');
    }
}
