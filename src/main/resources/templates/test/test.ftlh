
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h1>hello word</h1>
<button id="add">add</button>
<button id="delete">delete</button>
<button id="update">update</button>
<script>
    const add = document.getElementById("add");
    const deleteById = document.getElementById("delete");
    const updateById = document.getElementById("update");

    add.addEventListener("click", ()=>{
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8080/addHallManager", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        let data1 = JSON.stringify({
            "hall_name": "社区",
            "hall_community": "小区",
            "hall_house": "小区名字",
            "hall_address": "地址",
            "hall_area": 42,
            "hall_table_num": 100,
            "hall_deposit": 50
        });
        xhr.send(data1);
    })

    deleteById.addEventListener("click", ()=>{
        console.log("hello");
        let xhr = new XMLHttpRequest();
        xhr.open("DELETE", "http://localhost:8080/deletebyid/1");
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send();
    })

    updateById.addEventListener("click", ()=>{
        console.log("hello");
        let xhr = new XMLHttpRequest();
        xhr.open("PUT", "http://localhost:8080/updatebyid/1", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        let updatedata = JSON.stringify({
            "hall_name": "社区test",
            "hall_community": "小区test",
            "hall_house": "小区名字test",
            "hall_address": "地址test",
            "hall_area": 421,
            "hall_table_num": 1002,
            "hall_deposit": 502
        });
        xhr.send(updatedata);
    })




</script>
</body>
</html>