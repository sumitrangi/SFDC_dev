<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Account_Approved_Email_Alert</fullName>
        <description>Account Approved Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>sumitrangi@yahoo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Account_Approval_Process_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Approval_Status_Field_Approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Account Approval Status Field Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Approval_Status_Field_Pending</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending</literalValue>
        <name>Account Approval Status Field Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Approval_Status_Field_Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Not Approved</literalValue>
        <name>Account Approval Status Field Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>CreateNewAccount</fullName>
        <apiVersion>32.0</apiVersion>
        <endpointUrl>https://app.informaticaondemand.com/saas/api/1/salesforceoutboundmessage/VJb6IQrwBnXZ9OfQNjbiSaanbFlGdpyN</endpointUrl>
        <fields>AccountNumber</fields>
        <fields>BillingCity</fields>
        <fields>BillingCountry</fields>
        <fields>BillingPostalCode</fields>
        <fields>BillingState</fields>
        <fields>BillingStreet</fields>
        <fields>Id</fields>
        <fields>LastModifiedDate</fields>
        <fields>Name</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>sumitrangi@yahoo.com</integrationUser>
        <name>CreateNewAccount</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Create New Account ERP</fullName>
        <actions>
            <name>CreateNewAccount</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>1=1</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
