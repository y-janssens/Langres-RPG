import Loot from './loot';

export default class Inventory {
    constructor(data) {
        this.gold = data.gold;
        this.objects = data.objects.map((obj) => new Loot(obj));
        this.head = data.head ? new Loot(data.head) : null;
        this.legs = data.legs ? new Loot(data.legs) : null;
        this.torso = data.torso ? new Loot(data.torso) : null;
        this.right_hand = data.right_hand ? new Loot(data.right_hand) : null;
        this.left_hand = data.left_hand ? new Loot(data.left_hand) : null;
    }
}
