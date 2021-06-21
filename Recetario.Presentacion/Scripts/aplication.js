/*
Autor Julio C. Ramos
Logic of aplication
*/
$(document).ready(function function_name(argument) {
    $("input[type='number']").stepper();
    $("[data-toggle='tooltip']").tooltip();
    $('#editor').wysiwyg();
    var $affix = $(".affix-container"),
        $parent = $affix.parent(),
        resize = function() {
            $affix.width($parent.width());
        };
    $(window).resize(resize);
    resize();
    $("#form-nueva-receta-add-ingrediente").click(function() {
        $("#form-nueva-receta-ingredientes").append('<div class="form-group"><div class="col-sm-4"><input type="text" name="Ingredientes[0].Cantidad" class="form-control " placeholder="cantidad"></div><div class="col-sm-6"><input class="form-control " name="Ingredientes[0].Nombre" placeholder="Escribe el ingrediente"></div><div class="col-sm-1"><a class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Haz click aquí para quitar un ingrediente"><span class="glyphicon glyphicon-remove"></span></a></div></div>');
        reIndexIngredientes();
        $("[data-toggle='tooltip']").tooltip();
    });
	$("#form-nueva-receta-add-paso").click(function() {
        $("#form-nueva-receta-procedimientos").append('<div class="form-group"><div class="col-sm-4"><label class="col-sm-6 control-label" for="Pasos">Paso</label><div class="col-xs-6"><input class="form-control" type="number" /></div></div><div class="col-sm-7"><textarea class="form-control" rows="3" name="Paso[2].Descripcion" placeholder="Descripción..."></textarea></div><div class="col-sm-1"><a class="btn btn-danger btn-xs remove" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Haz clic aquí para quitar este paso "><span class="glyphicon glyphicon-remove"></span></a></div></div>');
        $("input[type='number']").stepper();
        reIndexProcedimientos();
        $("[data-toggle='tooltip']").tooltip();
    });
    function reIndexIngredientes() {
        $.each($("#form-nueva-receta-ingredientes .form-control"), function(key, value) {
            switch (key % 2) {
                case 0:
                    $(value).attr("name", "Ingredientes[" + Math.floor(key / 2)+"].Cantidad");
                    break;
                case 1: $(value).attr("name", "Ingredientes[" + Math.floor(key / 2) + "].Nombre");
                    break;
            }
        });
    }

    function reIndexProcedimientos(a) {
        $.each($("#form-nueva-receta-procedimientos .form-control"), function(key, value) {
            console.log(value);
            switch (key % 2) {
                case 0:
                    if (!$(value).val() || a) {
                        $(value).val(Math.floor(key / 2)+1);
                    }
                    $(value).attr("name", "Pasos[" + Math.floor(key / 2)+"].Numero");
                    break;
                case 1:
                    $(value).attr("name", "Pasos[" + Math.floor(key / 2) + "].Descripcion");
                    break;
            }
        });
    }
    $(document).on("click", "#form-nueva-receta-ingredientes .btn.remove", function() {
        $(this).parent().parent().remove();
        reIndexIngredientes();
    });
	$(document).on("click", "#form-nueva-receta-procedimientos .btn.remove", function() {
        $(this).parent().parent().remove();
        reIndexProcedimientos(true);
    });
    
    
});