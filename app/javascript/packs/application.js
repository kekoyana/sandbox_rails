// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

const images = require.context("../images", true)
const imagePath = name => images(name, true)

import Rails from "@rails/ujs"

Rails.start()

import "controllers"
