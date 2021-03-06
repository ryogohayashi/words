$(function(){
  $('.cardlist').sortable({
    update: function(e,ui){
      let item = ui.item;
      let item_data = item.data();
      let params = {_method: 'put'};
      params[item_data.modelName] = { row_order_position: item.index()}
      $.ajax({
        type: 'POST',
        url: item_data.updateUrl,
        dataType: 'json',
        data: params
      })
    },
    stop: function(e, ui){
      ui.item.children('div').not('#modalWindow').not('#overlay').not('.cardcontent__delete').effect('highlight', { color: "#FFFFCC" },500 )
    }
  });
});