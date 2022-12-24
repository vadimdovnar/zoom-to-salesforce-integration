trigger SW_Trigger_9bc16baf3fa7c10038c3f3778917 on Account (after update) {
    final List<SObjectField> fields = Account.getSObjectType()
        .getDescribe()
        .fields
        .getMap()
        .values();
    final List<String> fieldNames = new List<String>();
    for (SObjectField f : fields) {
        final String fieldName = f.getDescribe().getName();
        fieldNames.add(fieldName);
    }
    final String joinedFieldNames = String.join(fieldNames, ', ');
    for (SObject item : Trigger.New) {
        final String query = String.format(
            'SELECT {0} FROM Account WHERE Id = \'\'{1}\'\'',
            new List<String> {
                joinedFieldNames,
                String.valueOf(item.Id)
            }
        );
        final Account itemFull = (Account) Database.query(query);

        final Map<String, Account> eventData = new Map<String, Account>();
        eventData.put('New', itemFull);

        if (Trigger.OldMap != null) {
            final Account oldItem = (Account) Trigger.OldMap.get(item.Id);
            eventData.put('Old', oldItem);
        }

        final String content = SW_Callout_b33372362ed182f1d4bbc132cd50.jsonContent(eventData);
        SW_Callout_b33372362ed182f1d4bbc132cd50.callout('https://ae31fbab46f738986ddbd87b0c2fdab2.m.pipedream.net', content);
    }
}