@isTest
public class SW_Test_874a1db1c54e237c781a41ae6bb8089f {
    @isTest
    static void testBatch() {
        Test.setMock(HttpCalloutMock.class, new SW_CalloutMock_2be446a70ec4073138bc44ca('https://ae31fbab46f738986ddbd87b0c2fdab2.m.pipedream.net'));
        List<Account> a =
            (List<Account>) SW_SObjectFactory_59a1ddad133b66260b419d.createSObjectList('Account', true, 4);
        insert a;
        update a;
    }
    @isTest
    static void testSingle() {
        Test.setMock(HttpCalloutMock.class, new SW_CalloutMock_2be446a70ec4073138bc44ca('https://ae31fbab46f738986ddbd87b0c2fdab2.m.pipedream.net'));
        Account a = (Account) SW_SObjectFactory_59a1ddad133b66260b419d.createSObject('Account', true);
        insert a;
        update a;
    }
}