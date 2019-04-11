<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_HUD_Order_Email_ALert</fullName>
        <ccEmails>sumit.rangi@docusign.com</ccEmails>
        <description>New HUD Order Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>Account Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Sales Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Sales Rep</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>sumitrangi@yahoo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/HUD_Order</template>
    </alerts>
</Workflow>
