<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>VF Case Create</fullName>
        <actions>
            <name>VF_Case_Create_Task</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>VF Case Create 2</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Case_Milestone</fullName>
        <assignedTo>sumitrangi@yahoo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Case Milestone</subject>
    </tasks>
    <tasks>
        <fullName>VF_Case_Create_Task</fullName>
        <assignedTo>sumitrangi@yahoo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>VF Case Create Task</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Case.VF_SLA__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>VF Case Create Task</subject>
    </tasks>
</Workflow>
