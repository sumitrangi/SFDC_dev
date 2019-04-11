<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Contact_SLA_Update</fullName>
        <field>SLA_From_Workflow__c</field>
        <formula>TEXT(Account.SLA__c )</formula>
        <name>Contact SLA Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>SLA Workflow</fullName>
        <actions>
            <name>Contact_SLA_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(TEXT(Account.SLA__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
