<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ITCField_Update</fullName>
        <field>ITC__c</field>
        <formula>&quot;PurchaseOrder&quot;</formula>
        <name>ITCField Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TRANS_1</fullName>
        <field>ITC__c</field>
        <formula>&quot;POS&quot;</formula>
        <name>TRANS_1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UPDATE_FIELD</fullName>
        <field>POS_1__c</field>
        <formula>1</formula>
        <name>UPDATE FIELD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_PO_1</fullName>
        <field>PO__c</field>
        <formula>1</formula>
        <name>Update PO =1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Purchase_Orders</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Values</fullName>
        <field>Transaction_Type__c</field>
        <literalValue>POS</literalValue>
        <name>Update Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_fields_Value</fullName>
        <field>MRCHT__c</field>
        <formula>1</formula>
        <name>Update fields Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>ITC %3D Transaction Type</fullName>
        <actions>
            <name>Update_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Transaction__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Transactions Record Type</value>
        </criteriaItems>
        <criteriaItems>
            <field>Transaction__c.POS_Transaction_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>For PurchaseDeal Record Type</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ITC - CODE 1</fullName>
        <actions>
            <name>TRANS_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Transaction__c.ITC__c</field>
            <operation>contains</operation>
            <value>220</value>
        </criteriaItems>
        <description>ITC = 220 = POS</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ITC - CODE 2</fullName>
        <actions>
            <name>ITCField_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Transaction__c.ITC__c</field>
            <operation>contains</operation>
            <value>PURCHASEDEAL</value>
        </criteriaItems>
        <description>ITC = PURCHASEDEAL = PurchaseOrder</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PO %3D 1</fullName>
        <actions>
            <name>Update_PO_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Transaction__c.PO__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>POS %3D 1</fullName>
        <actions>
            <name>UPDATE_FIELD</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Transaction__c.ITC__c</field>
            <operation>equals</operation>
            <value>POS</value>
        </criteriaItems>
        <description>For Calculated Field : Total # POS Transactions</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>To Calculate Stores</fullName>
        <actions>
            <name>Update_fields_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Transaction__c.Store_RecordId__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>To be used on Contact</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type</fullName>
        <actions>
            <name>Update_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Transaction__c.Record_Id__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>For Purchase Order Record Type</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
