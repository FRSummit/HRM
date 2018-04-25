//var table = document.getElementById('myTable');
//
// for(var i = 1; i < table.rows.length; i++){
//        table.rows[i].onclick = function(){
//        //rIndex = this.rowIndex;
//        document.getElementById("idFiled").value = this.cells[0].innerHTML;
////        document.getElementById("lname").value = this.cells[1].innerHTML;
////        document.getElementById("age").value = this.cells[2].innerHTML;
//    };
//}

var table = document.getElementById('myTable');

for(var i = 1; i < table.rows.length; i++){
    table.rows[i].onclick = function(){
        //rIndex = this.rowIndex;
        document.getElementById("idField").value = this.cells[0].innerHTML;
    };
}


function showRow(row){
    var x=row.cells;
    document.getElementById("idField").value = x[0].innerHTML;
}