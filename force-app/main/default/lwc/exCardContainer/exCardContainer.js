import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/EX_CardController.getAccounts';

export default class ExCardContainer extends LightningElement {
    accounts = [];

    async connectedCallback(){
        this.accounts = await getAccounts();
        console.log(this.accounts);
    }
}