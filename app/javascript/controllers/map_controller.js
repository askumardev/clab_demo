import { Controller } from "@hotwired/stimulus";
// import * as L from "https://cdn.jsdelivr.net/npm/leaflet@1.8.0/dist/leaflet-src.esm.js";


export default class extends Controller {
  static targets = ["map"]

  connect() {
    const map = L.map('map')
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    // const sampleCoordinates = JSON.parse(this.mapTarget.dataset.sampleCoordinates);
    // console.log(sampleCoordinates);
    map.setView([40.801, -73.95], 8);
    var mkr = L.marker([40.801, -73.95]);
    mkr.addTo(map);
    const wellKnownText = this.mapTarget.dataset.wkt;
    console.log(wellKnownText);
    L.polygon( [[40.8100, -73.9580], [40.8007, -73.9298], [40.7644, -73.9498], [40.7644, -73.9580]]).addTo(map);
  }
}