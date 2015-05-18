//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require twitter/bootstrap
//= require jquery-fileupload

//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.responsive
//= require icheck

// Adminlte and corresponding Plugins
//= require admin-lte
//= require_tree .

$(function () {
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_flat-blue',
    increaseArea: '20%' // optional
  });
});
window.setTimeout(function() { $(".alert-info").alert('close'); }, 4000);
window.setTimeout(function() { $(".alert-success").alert('close'); }, 4000);
