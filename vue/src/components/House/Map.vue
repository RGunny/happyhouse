<template>
  <div>
    <google-map class="googleMap" @click="addMarker">
      <div slot-scope="{ google, map }">
        <google-map-marker
          v-for="(marker, index) in markers"
          :google="google"
          :map="map"
          :key="index"
          :position="marker.position"
          :info="marker.info"
          @click="panTo($event, map)"
        >
        </google-map-marker>
      </div>
    </google-map>
  </div>
</template>

<script>
export default {
  name: 'googlemap',
  props: ['maplist'],
  data() {
    return {
      markers: [],
      center: {},
    };
  },
  created() {
    console.log(this.maplist);
    for (var i = 0; i < this.maplist.length; i++) {
      var lat = Number(this.maplist[i].lat);
      var lng = Number(this.maplist[i].lng);
      this.markers.push({
        position: {
          lat,
          lng,
        },
        info: this.maplist[i],
      });
    }
  },
  methods: {
    addMarker(e) {},
    panTo(e, map) {
      map.panTo(e.latLng);
      map.setZoom(map.getZoom() + 2);
    },
  },
};
</script>
<style>
.googleMap {
  height: 1000px;
}
</style>
