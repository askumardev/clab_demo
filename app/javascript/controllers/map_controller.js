import { Controller } from "@hotwired/stimulus";
import * as L from "https://cdn.jsdelivr.net/npm/leaflet@1.8.0/dist/leaflet-src.esm.js";

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map"]

  connect() {
    console.log("hello.....satish");

    // Initialize the map
    const map = L.map(this.mapTarget).setView([32.07206917625161, -81.13390268058475], 13);

    // Add OpenStreetMap tile layer
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Parse WKT and add to the map
    const wellKnownText = this.mapTarget.dataset.wkt;

    if (wellKnownText) {
      const wkt = new Wkt.Wkt();
      const wellKnownText = this.mapTarget.dataset.wkt;
      wkt.read(wellKnownText);
      console.log(wellKnownText);

      // Convert WKT to GeoJSON
      const geojson = wkt.toJson();

      // Add GeoJSON layer to the map
      L.geoJSON(geojson).addTo(map);
    } else {
      console.error("No WKT data found in data-wkt attribute.");
    }
  }
}