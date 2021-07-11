<#macro test>
    hhhhhhhhhhhhh
</#macro>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h1>hello world. This is for ChargeType Post Method</h1>
<button id="add">add</button>
<button id="delete">delete</button>
<script>
    const add = document.getElementById("add");
    const deleteById = document.getElementById("delete");


    add.addEventListener("click", ()=>{
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8080/addChargeType", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        let data1 = JSON.stringify({
            "charge_name": "Initialized Charge Name",
            "charge_unit": "Initialized Charge Unit",
        });
        xhr.send(data1);
    })


    deleteById.addEventListener("click", ()=>{
        console.log("hello");
        let xhr = new XMLHttpRequest();
        xhr.open("DELETE", "http://localhost:8080/deleteChargeType/1");
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send();
    })


</script>
</body>
</html>