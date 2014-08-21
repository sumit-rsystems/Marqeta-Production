<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>T1_to_Organization</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Organization_Record_Type</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>T1 to Organization</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_T1_Value_to_Merchant</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Merchant_Record_Type</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update T1 Value to Merchant</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_the_EP</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Enterprise_Record</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update the EP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>T1 %3D Enterprise Partner</fullName>
        <actions>
            <name>Update_the_EP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.T1__c</field>
            <operation>equals</operation>
            <value>Enterprise Partner</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>T1 %3D Merchant</fullName>
        <actions>
            <name>Update_T1_Value_to_Merchant</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.T1__c</field>
            <operation>equals</operation>
            <value>Merchant</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>T1 %3D Organization Partner</fullName>
        <actions>
            <name>T1_to_Organization</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.T1__c</field>
            <operation>equals</operation>
            <value>Organization</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
