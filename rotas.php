<?php

use Pecee\SimpleRouter\SimpleRouter;
use sistema\Nucleo\Helpers;

// Configurar variáveis de ambiente para o Simple Router
if (!isset($_SERVER['REQUEST_URI'])) {
    $_SERVER['REQUEST_URI'] = '/';
}

if (!isset($_SERVER['REQUEST_METHOD'])) {
    $_SERVER['REQUEST_METHOD'] = 'GET';
}

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
} catch (Exception $ex) {
    if(Helpers::localhost()){
        echo "Erro: " . $ex->getMessage();
    } else {
        Helpers::redirecionar('404');
    }
}
