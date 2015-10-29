$(document).ready(function(){
	function updateDom(data){
		var artData = JSON.parse(data);
		$("#artName").html(artData.artName);
		$("#artistName").html(artData.artistName);
		$("#buildingName").html(artData.buildingName);
		$("#notes").html(artData.notes);
		$("#artImg").attr("src","static/images/" + artData.image);
		$("#content").show();

		latLong = new google.maps.LatLng(artData.latitude,artData.longitude);
		
		var mapProp = {
			center:latLong,
			zoom:16,
			mapTypeId:google.maps.MapTypeId.ROADMAP
		};

		var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

		var marker = new google.maps.Marker({
			position : latLong
		});

		marker.setMap(map);
		
		google.maps.event.addDomListener(window, 'load');
	};

	$.ajax("http://localhost:8080/artData").done(function(data){
		var artList = JSON.parse(data);
		
		$.each(artList,function(key,value){
            var option = $('<option />').val(value.artId).text(value.artName);
			$("#artDropdown").append(option);
        });
		
	});

	$("#artDropdown").change(function(data){
		
		if( data.currentTarget.value == 0){
			$("#content").hide();
		}else{
			$.ajax("http://localhost:8080/artData/" + data.currentTarget.value).done(function(data){
				updateDom(data);
			});
		}
	});
});
