<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Average_POS_Amount</fullName>
        <field>Average_Ticket_Size__c</field>
        <formula>Average_Ticket_Size__c</formula>
        <name>Average POS Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateStageFieldValue</fullName>
        <field>StageName</field>
        <literalValue>1-Qualified</literalValue>
        <name>UpdateStageFieldValue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Blog_Site</fullName>
        <field>Blog_Site__c</field>
        <formula>Blog_Site__c</formula>
        <name>Update: Blog Site</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_Database_Size</fullName>
        <field>Email_Database_Size__c</field>
        <formula>Email_Database_Size__c</formula>
        <name>Update: Email Database Size</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_Frequency</fullName>
        <field>Email_Frequency__c</field>
        <formula>Email_Frequency__c</formula>
        <name>Update: Email Frequency</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_Newsletters</fullName>
        <field>Emails_Newsletters__c</field>
        <formula>Emails_Newsletters__c</formula>
        <name>Update: Email/Newsletters</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Facebook_Page</fullName>
        <field>Facebook_Page__c</field>
        <formula>Facebook_Page__c</formula>
        <name>Update: Facebook Page</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Marketing_Budget</fullName>
        <field>Marketing_Budget__c</field>
        <formula>Marketing_Budget__c</formula>
        <name>Update: Marketing Budget</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_No_of_Locations</fullName>
        <field>No_of_Locations__c</field>
        <formula>No_of_Locations__c</formula>
        <name>Update: No. of Locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Immediately</fullName>
        <field>status__c</field>
        <literalValue>soon</literalValue>
        <name>Update Status Immediately</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sub_Type</fullName>
        <field>Sub_Type1__c</field>
        <formula>TEXT( Sub_Type__c )</formula>
        <name>Update Sub Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Website</fullName>
        <field>Website</field>
        <formula>Website__c</formula>
        <name>Update: Website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Change Sub Type on Account</fullName>
        <actions>
            <name>Update_Sub_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>4-Closed Won</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Change the status of Account</fullName>
        <actions>
            <name>Update_Status_Immediately</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>4-Closed Won</value>
        </criteriaItems>
        <description>When Opportunity Stage is updated to Closed/Won update Status field within Account object to Soon.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Sales Process %23  Point 13</fullName>
        <actions>
            <name>Assess_merchant_to_develop_launch_plan</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Test_Swipe_with_Merchant</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>4-Closed Won</value>
        </criteriaItems>
        <description>When opportunity is updated to Closed/Won create the below tasks and assign to relationship manager for the account:
1. Test Swipe with Merchant, to be done at each location participating
2. Assess merchant to develop launch plan</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Sales Process - Point %23 12</fullName>
        <actions>
            <name>Create_About_Us_Content</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Create_Social_Media</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Update_Field_Facebook</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Update_Field_Facebook_Page</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>4-Closed Won</value>
        </criteriaItems>
        <description>When opportunity is updated to Closed/Won create the below tasks and assign to the marketing contact for the account:
1. Create about us content
2. Create social media content
3. Update field labeled Twitter handle
4. update field facebook page</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Sales Process - Point %23 14</fullName>
        <actions>
            <name>Credit_Fraud_Check</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Merchant_Set_up_in_Admin_Portal</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Request_Logo_creation_in_Basecamp</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Validate_MID_with_Discover</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>4-Closed Won</value>
        </criteriaItems>
        <description>When opportunity is updated to Closed/Won create below tasks and assign to partner services contact for the account:1. Credit/Fraud Check
2. Request Logo creation in Basecamp
3. Validate MID with Discover
4. Merchant Set up in Admin Portal</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Field Values %28P1%29</fullName>
        <actions>
            <name>Average_POS_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Blog_Site</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Email_Database_Size</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Email_Frequency</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Email_Newsletters</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Facebook_Page</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Marketing_Budget</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_No_of_Locations</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Website</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>4-Closed Won</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateStageFieldValue</fullName>
        <actions>
            <name>UpdateStageFieldValue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Assess_merchant_to_develop_launch_plan</fullName>
        <assignedTo>Relationship_Manager</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Assess merchant to develop launch plan.

Thanks,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Assess merchant to develop launch plan</subject>
    </tasks>
    <tasks>
        <fullName>Create_About_Us_Content</fullName>
        <assignedTo>Marketing_Role</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Please create the Marketing Role on Account Object.

Regards,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Create About Us Content</subject>
    </tasks>
    <tasks>
        <fullName>Create_Social_Media</fullName>
        <assignedTo>Marketing_Role</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Please create the social media on Account Object.

Thanks,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Create Social Media</subject>
    </tasks>
    <tasks>
        <fullName>Credit_Fraud_Check</fullName>
        <assignedTo>Partner_Services</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Please do  Credit/Fraud Check.

Thanks,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Credit/Fraud Check</subject>
    </tasks>
    <tasks>
        <fullName>Merchant_Set_up_in_Admin_Portal</fullName>
        <assignedTo>Partner_Services</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Please set the Merchant Set up in Admin Portal.

Thanks,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Merchant Set up in Admin Portal</subject>
    </tasks>
    <tasks>
        <fullName>Request_Logo_creation_in_Basecamp</fullName>
        <assignedTo>Partner_Services</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Please create the &quot;Request Logo creation in Basecamp&quot;

Thanks,
System Administraor</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Request Logo creation in Basecamp</subject>
    </tasks>
    <tasks>
        <fullName>Test_Swipe_with_Merchant</fullName>
        <assignedTo>Relationship_Manager</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Test Swipe with Merchant, to be done at each location participating.

Thanks,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Test Swipe with Merchant,</subject>
    </tasks>
    <tasks>
        <fullName>Update_Field_Facebook</fullName>
        <assignedTo>Marketing_Role</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Please update / create the Facebook Page on Account object.

Regards,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Update Field : Facebook Page</subject>
    </tasks>
    <tasks>
        <fullName>Update_Field_Facebook_Page</fullName>
        <assignedTo>Marketing_Role</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Please create / update the Twitter Handle field on the account object.

Thanks,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Update Field : Twitter Handle</subject>
    </tasks>
    <tasks>
        <fullName>Validate_MID_with_Discover</fullName>
        <assignedTo>Partner_Services</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Dear User,

Validate MID with Discover.

Thanks,
System Administrator</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Validate MID with Discover</subject>
    </tasks>
</Workflow>
