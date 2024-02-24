import { BaseEngine } from './';

export default class Inventory extends BaseEngine {
    constructor({ right_hand, left_hand, head, torso, legs, objects }) {
        super();
        this.right_hand = right_hand;
        this.left_hand = left_hand;
        this.head = head;
        this.torso = torso;
        this.legs = legs;
        this.objects = objects;
        this.instantiate(this);
    }
}
