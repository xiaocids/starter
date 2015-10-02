<?php

use common\rbac\Migration;
use common\models\User;

class m150625_214101_roles extends Migration
{
    public function up()
    {
        $this->auth->removeAll();

        $staff = $this->auth->createRole(User::ROLE_STAFF);
        $this->auth->add($staff);
        
        $supervisor = $this->auth->createRole(User::ROLE_SUPERVISOR);
        $this->auth->add($supervisor);
        $this->auth->addChild($supervisor, $staff);

        $manager = $this->auth->createRole(User::ROLE_MANAGER);
        $this->auth->add($manager);
        $this->auth->addChild($manager, $supervisor);

        $director = $this->auth->createRole(User::ROLE_DIRECTOR);
        $this->auth->add($director);
        $this->auth->addChild($director, $manager);
        
        $presdir = $this->auth->createRole(User::ROLE_PRESDIR);
        $this->auth->add($presdir);
        $this->auth->addChild($presdir, $director);
        
        $superpower = $this->auth->createRole(User::ROLE_SUPERPOWER);
        $this->auth->add($superpower);
        $this->auth->addChild($superpower, $presdir);

        $this->auth->assign($superpower, 1);
        $this->auth->assign($presdir, 2);
        $this->auth->assign($director, 3);
    }

    public function down()
    {
        $this->auth->remove($this->auth->getRole(User::ROLE_SUPERPOWER));
        $this->auth->remove($this->auth->getRole(User::ROLE_PRESDIR));
        $this->auth->remove($this->auth->getRole(User::ROLE_DIRECTOR));
    }
}
