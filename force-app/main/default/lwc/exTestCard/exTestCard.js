import { LightningElement, api } from 'lwc';

export default class ExTestCard extends LightningElement {
    status = 'Status';
    start = 'Start';
    department = 'Department';
    leadAuditor = 'Lead Auditor';
    isMenu = false;
    @api accounts;

    get cardColor(){
        return this.accounts.status ==='Ready'? 'border-color-green':
                (this.accounts.status === 'Planning' ? 'border-color-yellow' : 'border-color-red');
    }

    handleClick(){
        this.isMenu = !this.isMenu;
    }
}