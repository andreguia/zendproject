<?php

class AccountController extends Zend_Controller_Action
{
    /**
     *
     * @var Zend_Log
     */
    private $logger;
    
    public function init()
    {
        $this->logger = Zend_Registry::get('logger');
    }

    public function indexAction()
    {
        // action body
    }

    public function loginAction()
    {
        // action body
    }

    public function logoutAction()
    {
        // action body
    }


}





