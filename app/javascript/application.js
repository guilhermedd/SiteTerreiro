import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import ImageFieldsController from "./controllers/image_fields_controller"

const application = Application.start()

// Registra os controladores do Stimulus
application.register("image_fields", ImageFieldsController)
