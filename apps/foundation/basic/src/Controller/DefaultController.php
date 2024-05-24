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

    #[Route('/overview', name: 'app_overview')]
    public function raw(): Response
    {
        return $this->render('default/overview.html.twig');
    }

    #[Route('/example', name: 'app_example')]
    public function example(): Response
    {
        return $this->render('default/example.html.twig');
    }
}
