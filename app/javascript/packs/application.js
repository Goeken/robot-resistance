// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

// SCSS
import 'scss/base';
import 'scss/pages';

// JS
import 'js/base';

const images = require.context('../images', true)
window.jQuery = window.$ = require('jquery')