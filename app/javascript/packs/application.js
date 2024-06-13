// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import './preview'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

var jscrollOption = {
  loadingHtml: '読み込み中・・・',
  autoTrigger: true,
  padding: 0,
  contentSelector: $('.jscroll-div').attr("tab"),
  nextSelector: 'span.next a'
}

$(document).on('turbolinks:load',function() {
    $(".jscroll-div").jscroll(jscrollOption);
});

$(document).on("turbolinks:load", function(){
  let target = document.getElementById( "message_scroll" );
  target.scrollIntoView(false);
});

$('#tab-contents .tab[id != "tab1"]').hide();

$('#tab-menu a').on('click', function(event) {
  $("#tab-contents .tab").hide();
  $("#tab-menu .active").removeClass("active");
  $(this).addClass("active");
  $($(this).attr("href")).show();
  event.preventDefault();
});