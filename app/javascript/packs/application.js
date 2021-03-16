// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import JQuery from 'jquery';
window.$ = window.jQuery = JQuery;

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Fontawesome
import "@fortawesome/fontawesome-free/css/all"

// Bootstrap
require("bootstrap")

// Start Bootstrap Grayscale Theme
require("jquery.easing/jquery.easing")
require("packs/scripts")
const images = require.context('../images', true)

// Toastr
global.toastr = require("toastr")

// Cocoon
require("@nathanvda/cocoon")

// Selectize
require("selectize")
require("packs/ingredient")


import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
