// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree.

function sell_milk(){ /* Обнавляет поле продажи молока*/
	$.ajax({
            url: "/sell_milk",
            type: "GET",
            success: function() {$(".sell_milk").unreel();}
        });
};

function cow_new(){ /* Обновляет поле общей информации и информации из списка*/
	$.ajax({
            type: "GET",
            success: function() {$(".list").unreel();
        						 $(".sell_milk").unreel();}
        });
};

function sell_cow($id){ /* продажа коровы*/
	$.ajax({
            url: "/cow/"+$id,
            type: "DELETE",
            success: function() { $(".list").unreel();
        						  $(".sell_milk").unreel();	}
        });
};

function milk_d($id){ /* сдойка молока */
	$.ajax({
            url: "/milk_destroy/"+$id,
            type: "GET",
            success: function() {
            	$(".milk_v").unreel();
            	$(".listing").unreel();
            					 }
        });
};

function milk_add() /* накопление молока */
{
	$.ajax({
            url: "/milk_add",
            type: "GET",
            success: function() {$(".listing").unreel();
        }
        });
	setTimeout(milk_add, 30000);

}