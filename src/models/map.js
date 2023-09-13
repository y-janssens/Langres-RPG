import { useLoader } from "@react-three/fiber";
import { TextureLoader } from "three";

export default class MapAssets {
  constructor() {
    this.assets = [
      {
        name: "border",
        key: "F",
        src: [
          "./assets/map/borders/{}.png",
          "./assets/map/borders/{}.png",
          "./assets/map/borders/{}.png"
        ]
      },
      {
        name: "tree",
        key: "T",
        src: [
          "./assets/map/trees/1.png",
          "./assets/map/trees/2.png",
          "./assets/map/trees/3.png",
          "./assets/map/trees/3.png",
          "./assets/map/trees/5.png",
          "./assets/map/trees/6.png",
          "./assets/map/trees/7.png",
          "./assets/map/trees/8.png",
          "./assets/map/trees/9.png",
          "./assets/map/trees/10.png",
          "./assets/map/trees/11.png",
          "./assets/map/trees/12.png",
          "./assets/map/trees/13.png",
          "./assets/map/trees/14.png"
        ]
      },
      {
        name: "grass",
        key: "-",
        src: ["./assets/map/grass/grass-1.jpg"]
      },
      {
        name: "rock",
        key: "R",
        src: [
          "./assets/map/rocks/{}.png",
          "./assets/map/rocks/{}.png",
          "./assets/map/rocks/{}.png"
        ]
      },
      {
        name: "ground",
        key: "C",
        src: [
          "./assets/map/grounds/{}.png",
          "./assets/map/grounds/{}.png",
          "./assets/map/grounds/{}.png"
        ]
      }
    ];
    this.validKeys = ["-", "C"];
    this.borderKeys = ["F", "T"];
  }

  get_asset(item) {
    const asset = this.assets.find((as) => as.key === item.value);
    return asset.src[Math.floor(Math.random() * asset.src.length)];
  }

  get_grass() {
    const asset = this.assets.find((as) => as.key === "-");
    return useLoader(TextureLoader, asset.src[0]);
  }

  get_trees(data) {
    let items = [];
    data.forEach((row) =>
      row.forEach((item, index) => {
        if (item.value === "T") {
          items.push({
            id: item.id,
            map: useLoader(TextureLoader, this.get_asset(item))
          });
        }
      })
    );
    return items;
  }

  get_items_ids(item, world) {
    let validIds = [];
    let invalidIds = [];
    let id = item.id;
    const max_index = world.width * world.height;
    const ids = [id, id + 1, id - 1, id + world.width, id - world.width];

    ids
      .filter((i) => i > 0 && i <= max_index)
      .map((it) => {
        if (!this.validKeys.includes(world.content[it].value)) {
          return invalidIds.push(it);
        }
        return validIds.push(it);
      });

    return { validIds, invalidIds };
  }
}
