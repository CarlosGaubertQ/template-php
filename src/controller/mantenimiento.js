$(document).on('click', '../routes/llamada.php', function(){
  if(confirm('are you sure?')){
    let element = $(this)[0].parentElement.parentElement
    let id = $(element).attr('taskid')
    $.post('../routes/llamada.php', {id}, function(response){
      fetchTasks();
    })
  }
})

