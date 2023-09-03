import { invoke } from "@tauri-apps/api/tauri";
export default class World {
  constructor({ width, height, content }) {
    this.width = width;
    this.height = height;
    this.content = content;
  }

  parse() {
    let content = this.content;
    let size = this.width;
    let output = Array.from(
      { length: Math.ceil(content.length / size) },
      (_, index) => {
        const start = index * size;
        const end = start + size;
        return content.slice(start, end);
      }
    );

    let id = 0;
    return output.map((row, index) => {
      return row.map((item, subindex) => {
        return { id: id++, y: index, x: subindex, value: item };
      });
    });
  }

  async regenerate(data) {
    await invoke("regenerate", { data });
  }
}
