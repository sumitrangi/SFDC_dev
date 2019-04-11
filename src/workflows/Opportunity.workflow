<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Account_Stalled_counter_increase</fullName>
        <field>Stalled_counter__c</field>
        <formula>IF( ISNULL(Account.Stalled_counter__c), 
1, 
Account.Stalled_counter__c + 1 
)</formula>
        <name>Account Stalled counter increase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Push_Counter_Field</fullName>
        <description>Increment the Push Counter by 1</description>
        <field>Push_Counter__c</field>
        <formula>IF( 
ISNULL( Push_Counter__c ), 
1, 
Push_Counter__c + 1 
)</formula>
        <name>Increment Push Counter Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppty_name_with_Account_name</fullName>
        <field>Name</field>
        <formula>Account.Name  &amp; &quot; : &quot; &amp; Name</formula>
        <name>Oppty name with Account name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity name check</fullName>
        <actions>
            <name>Oppty_name_with_Account_name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(CONTAINS(Name, Account.Name))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Oppty Lost counter</fullName>
        <actions>
            <name>Account_Stalled_counter_increase</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(StageName, &quot;Closed Lost&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Push Counter</fullName>
        <actions>
            <name>Increment_Push_Counter_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Increment the Push Counter field by 1</description>
        <formula>IF(  CloseDate &gt; PRIORVALUE( CloseDate ),  IF (MONTH(CloseDate) &lt;&gt; MONTH(PRIORVALUE( CloseDate )) ,  TRUE,  FALSE),  FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
