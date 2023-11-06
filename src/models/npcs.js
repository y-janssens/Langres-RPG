// import { invoke } from '@tauri-apps/api/tauri';

// export default class Npcs {
//     constructor() {
//         this.npcs = [];
//         this.get();
//     }

//     async get() {
//         let npcs = [];
//         await invoke('get_npcs')
//             .then((response) => {
//                 response.forEach((it) => {
//                     npcs.push(new Npc(it));
//                 });
//             })
//             .finally(() => {
//                 this.npcs = npcs;
//             });
//     }

//     get_npc(id) {
//         const npc = this.npcs.find((i) => i.id === id);
//         return new Npc(npc);
//     }
// }

// export class Npc {
//     constructor(item) {
//         this.id = item.id;
//         this.character_name = item.character_name;
//         this.content = item.content;
//     }

//     get_dialogs(id) {
//         const index = id || 0;
//         const quotes = this.content[0].quotes;
//         return {
//             id: index,
//             text: this.content[0].quotes[index],
//             next: index + 1 < quotes.length ? index + 1 : null
//         };
//     }
// }
