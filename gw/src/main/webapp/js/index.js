/**
 * 
 */

 window.initMap = function () {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.502218, lng: 127.024358 },
    zoom:20,
    
  });

	const cosmos = [
		{
			label : "C", 
			name : "COSMOS",
			lat : 37.502218,
			lng : 127.024358,
		},
	];

	const bounds = new google.maps.LatLngBounds();

	  cosmos.forEach(({ label, name, lat, lng }) => {
	    const marker = new google.maps.Marker({
	      position: { lat, lng },
	      label,
	      map,
	    });
	    bounds.extend(marker.position);
	  });
	
	  // 모든 마커를 포함하도록 지도 영역을 설정합니다.
	  //map.fitBounds(bounds);
	};

