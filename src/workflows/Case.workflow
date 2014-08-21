<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Support_Notification2_Response_Received_from_Contact</fullName>
        <description>Support: Notification Response Received from Contact</description>
        <protected>false</protected>
        <recipients>
            <recipient>melissa@marqeta.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SUPPORT_Response_Received</template>
    </alerts>
    <alerts>
        <fullName>Support_Notification_Response_Received_from_Contact</fullName>
        <description>Support: Notification Response Received from Contact</description>
        <protected>false</protected>
        <recipients>
            <recipient>melissa@marqeta.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SUPPORT_Response_Received</template>
    </alerts>
    <fieldUpdates>
        <fullName>Customer_Support_Case_Owner_Update</fullName>
        <field>OwnerId</field>
        <lookupValue>asellassie@marqeta.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Customer Support Case Owner Update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Jamba_Support_Case_Owner_Update</fullName>
        <field>OwnerId</field>
        <lookupValue>phill@marqeta.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Jamba Support Case Owner Update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Marketing_Department</fullName>
        <field>Department__c</field>
        <literalValue>Marketing</literalValue>
        <name>Set Marketing Department</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_jamba_field</fullName>
        <field>Department__c</field>
        <literalValue>Jamba Juice STS Program</literalValue>
        <name>Set Jamba Department Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Depatment</fullName>
        <field>Department__c</field>
        <literalValue>Customer Support</literalValue>
        <name>Update Depatment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>SUPPORT%3A Case Modified Notification</fullName>
        <actions>
            <name>Support_Notification2_Response_Received_from_Contact</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Response Received</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Re-Opened</value>
        </criteriaItems>
        <description>Whenever case is modified notification is sent.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Jamba department</fullName>
        <actions>
            <name>Jamba_Support_Case_Owner_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_jamba_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Jamba Juice via Email</value>
        </criteriaItems>
        <description>set the jamba department</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Marketing Department</fullName>
        <actions>
            <name>Set_Marketing_Department</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Marketing via Email</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Support Department</fullName>
        <actions>
            <name>Customer_Support_Case_Owner_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Depatment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Support via Email</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
