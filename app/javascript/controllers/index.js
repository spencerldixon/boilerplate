// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FlashController from "./flash_controller"
application.register("flash", FlashController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import ConfettiController from "./confetti_controller"
application.register("confetti", ConfettiController)

