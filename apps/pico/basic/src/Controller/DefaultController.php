<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DefaultController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(): Response
    {
        return $this->render('default/index.html.twig');
    }

    #[Route('/preview', name: 'app_preview')]
    public function preview(): Response
    {
        return $this->render('default/preview.html.twig');
    }

    #[Route('/raw', name: 'app_raw')]
    public function raw(): Response
    {
        return $this->render('default/raw.html.twig');
    }
}
