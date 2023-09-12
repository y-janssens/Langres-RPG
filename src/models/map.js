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
          "./assets/map/trees/{}.png",
          "./assets/map/trees/{}.png",
          "./assets/map/trees/{}.png"
        ]
      },
      {
        name: "grass",
        key: "-",
        src: [
          "./assets/map/grass/{}.png",
          "./assets/map/grass/{}.png",
          "./assets/map/grass/{}.png"
        ]
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
    return asset.src[Math.floor(Math.random() * asset.length)];
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
