/* mtb */
let contador = []
let voltarUltimoLocal = false
window.addEventListener("message", function (event) {
    let { action } = event.data

    if(action == "abrir"){
        $("body").show()

    }else if(action == "fechar"){
        $("body").hide()
    }

});

const choice = (element) =>{
    let place = $(element).data("name")
    $.post("http://404_realisticSpawn/escolha", JSON.stringify(place))
}

$(".post-garagem-central").hover(
    function(){
        $(".item-garagem-central").show()
    },function(){
        $(".item-garagem-central").hide()
    }
)

$(".post-garagem-praia").hover(
    function(){
        $(".item-garagem-praia").show()
    },function(){
        $(".item-garagem-praia").hide()
    }
)

$(".post-garagem-sandy").hover(
    function(){
        $(".item-garagem-sandy").show()
    },function(){
        $(".item-garagem-sandy").hide()
    }
)

$(".post-garagem-paleto").hover(
    function(){
        $(".item-garagem-paleto").show()
    },function(){
        $(".item-garagem-paleto").hide()
    }
)

const returnPlace = () => {
    voltarUltimoLocal = true
    $.post("http://404_realisticSpawn/escolha", JSON.stringify({voltarUltimoLocal}))
}

/* MTB */