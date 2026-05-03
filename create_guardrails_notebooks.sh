#!/bin/bash
set -e

# ==========================================================
# AI Guardrails Notebook Folder Generator
# This script creates folders and .ipynb files for Guardrails notes.
# Target directory:
# /Users/myadav/Downloads/Guardrails
# ==========================================================

BASE_DIR="/Users/myadav/Downloads/Guardrails"

mkdir -p "$BASE_DIR"

python3 <<'PY'
import json
import os
import re
from pathlib import Path

BASE_DIR = Path("/Users/myadav/Downloads/Guardrails")
BASE_DIR.mkdir(parents=True, exist_ok=True)

topics = [
    {
        "folder": "1. Guardrails Fundamentals",
        "subtopics": [
            ("Guardrails_Introduction", "What are AI Guardrails"),
            ("Guardrails_Need", "Why Guardrails are Needed"),
            ("Guardrails_History", "History of Guardrails"),
            ("Guardrails_vs_Moderation", "Guardrails vs Moderation"),
            ("Guardrails_vs_AI_Security", "Guardrails vs AI Security"),
            ("Guardrails_vs_AI_Governance", "Guardrails vs AI Governance"),
            ("Guardrails_in_LLM_Applications", "Guardrails in LLM Applications"),
            ("Guardrails_in_Agentic_AI", "Guardrails in Agentic AI Systems"),
        ],
    },
    {
        "folder": "2. Evolution of Guardrails",
        "subtopics": [
            ("Rule_Based_Validation", "Rule-Based Validation"),
            ("Content_Moderation", "Content Moderation"),
            ("Chatbot_Safety_Filters", "Chatbot Safety Filters"),
            ("LLM_Alignment_and_Safety", "LLM Alignment and Safety"),
            ("Prompt_Injection_Protection", "Prompt Injection Protection"),
            ("Enterprise_AI_Guardrails", "Enterprise AI Guardrails"),
            ("Domain_Specific_Guardrails", "Domain-Specific Guardrails"),
        ],
    },
    {
        "folder": "3. Benefits and Trade Offs",
        "subtopics": [
            ("Advantages_of_Guardrails", "Advantages of Guardrails"),
            ("Disadvantages_of_Guardrails", "Disadvantages of Guardrails"),
            ("Latency_Impact", "Latency Impact"),
            ("Cost_Impact", "Cost Impact"),
            ("False_Positive_Risk", "False Positive Risk"),
            ("False_Negative_Risk", "False Negative Risk"),
            ("Maintenance_Effort", "Maintenance Effort"),
            ("Over_Restriction_Risk", "Over-Restriction Risk"),
        ],
    },
    {
        "folder": "4. How Guardrails Work",
        "subtopics": [
            ("User_Input_Check", "User Input Check"),
            ("Input_Sanitization", "Input Sanitization"),
            ("Policy_Validation", "Policy Validation"),
            ("Instruction_Validation", "Instruction Validation"),
            ("Retrieval_Validation", "Retrieval Validation"),
            ("Tool_Action_Validation", "Tool / Action Validation"),
            ("LLM_Response_Generation", "LLM Response Generation"),
            ("Output_Validation", "Output Validation"),
            ("Retry_Regeneration", "Retry / Regeneration"),
            ("Block_Mask_Escalate", "Block / Mask / Escalate"),
            ("Logging_and_Monitoring", "Logging and Monitoring"),
            ("Human_Review", "Human Review"),
        ],
    },
    {
        "folder": "5. Guardrails Architecture",
        "subtopics": [
            ("User_Interface_Layer", "User Interface Layer"),
            ("API_Gateway_Request_Layer", "API Gateway / Request Layer"),
            ("Policy_Engine_Layer", "Policy Engine Layer"),
            ("Input_Guardrail_Layer", "Input Guardrail Layer"),
            ("Prompt_Instruction_Layer", "Prompt / Instruction Layer"),
            ("Retrieval_RAG_Layer", "Retrieval / RAG Layer"),
            ("LLM_Orchestration_Layer", "LLM Orchestration Layer"),
            ("Tool_Execution_Layer", "Tool Execution Layer"),
            ("Output_Guardrail_Layer", "Output Guardrail Layer"),
            ("Human_Approval_Layer", "Human Approval Layer"),
            ("Monitoring_and_Audit_Layer", "Monitoring and Audit Layer"),
        ],
    },
    {
        "folder": "6. Core Guardrail Layers",
        "subtopics": [
            ("Policy_Layer", "Policy Layer"),
            ("Acceptable_Use_Policy", "Acceptable Use Policy"),
            ("Business_Rules", "Business Rules"),
            ("Compliance_Rules", "Compliance Rules"),
            ("Risk_Classification", "Risk Classification"),
            ("User_Role_Permissions", "User Role Permissions"),
            ("Data_Access_Rules", "Data Access Rules"),
            ("Escalation_Rules", "Escalation Rules"),
            ("Human_Approval_Rules", "Human Approval Rules"),
            ("Input_Layer", "Input Layer"),
            ("Prompt_Injection_Detection", "Prompt Injection Detection"),
            ("Jailbreak_Detection", "Jailbreak Detection"),
            ("PII_Detection", "PII Detection"),
            ("Toxicity_Detection", "Toxicity Detection"),
            ("Malicious_Intent_Detection", "Malicious Intent Detection"),
            ("Domain_Scope_Validation", "Domain Scope Validation"),
            ("Input_Sanitization", "Input Sanitization"),
            ("File_Upload_Validation", "File Upload Validation"),
            ("Instruction_Layer", "Instruction Layer"),
            ("System_Prompt_Protection", "System Prompt Protection"),
            ("Role_Boundary_Enforcement", "Role Boundary Enforcement"),
            ("Prompt_Hierarchy_Enforcement", "Prompt Hierarchy Enforcement"),
            ("Instruction_Conflict_Detection", "Instruction Conflict Detection"),
            ("Refusal_Policy", "Refusal Policy"),
            ("Tone_and_Format_Rules", "Tone and Format Rules"),
            ("Domain_Specific_Answer_Rules", "Domain-Specific Answer Rules"),
            ("Retrieval_Layer", "Retrieval Layer"),
            ("Source_Whitelisting", "Source Whitelisting"),
            ("Document_Access_Control", "Document Access Control"),
            ("Chunk_Relevance_Check", "Chunk Relevance Check"),
            ("Sensitive_Chunk_Filtering", "Sensitive Chunk Filtering"),
            ("Stale_Document_Detection", "Stale Document Detection"),
            ("Citation_Enforcement", "Citation Enforcement"),
            ("Context_Grounding_Check", "Context Grounding Check"),
            ("RAG_Prompt_Injection_Detection", "RAG Prompt Injection Detection"),
            ("Execution_Layer", "Execution Layer"),
            ("Tool_Permission_Check", "Tool Permission Check"),
            ("Function_Argument_Validation", "Function Argument Validation"),
            ("API_Call_Validation", "API Call Validation"),
            ("Database_Query_Guardrails", "Database Query Guardrails"),
            ("Transaction_Approval", "Transaction Approval"),
            ("Rate_Limiting", "Rate Limiting"),
            ("Sandboxing", "Sandboxing"),
            ("Rollback_Recovery", "Rollback / Recovery"),
            ("Human_Approval_for_High_Risk_Actions", "Human Approval for High-Risk Actions"),
            ("Output_Layer", "Output Layer"),
            ("PII_Redaction", "PII Redaction"),
            ("Toxic_Output_Filtering", "Toxic Output Filtering"),
            ("Confidential_Data_Leakage_Check", "Confidential Data Leakage Check"),
            ("Hallucination_Detection", "Hallucination Detection"),
            ("Factuality_Validation", "Factuality Validation"),
            ("Unsupported_Claim_Detection", "Unsupported Claim Detection"),
            ("Citation_Validation", "Citation Validation"),
            ("Structured_Output_Validation", "Structured Output Validation"),
            ("Safe_Refusal_Response", "Safe Refusal Response"),
            ("Disclaimer_Validation", "Disclaimer Validation"),
            ("Monitoring_Layer", "Monitoring Layer"),
            ("Prompt_Logs", "Prompt Logs"),
            ("Response_Logs", "Response Logs"),
            ("Guardrail_Decision_Logs", "Guardrail Decision Logs"),
            ("Tool_Call_Logs", "Tool Call Logs"),
            ("Violation_Alerts", "Violation Alerts"),
            ("Human_Review_Logs", "Human Review Logs"),
            ("Latency_Monitoring", "Latency Monitoring"),
            ("Cost_Monitoring", "Cost Monitoring"),
            ("Drift_Monitoring", "Drift Monitoring"),
            ("Audit_Reports", "Audit Reports"),
        ],
    },
    {
        "folder": "7. Main Types of AI Guardrails",
        "subtopics": [
            ("Input_Guardrails", "Input Guardrails"),
            ("Output_Guardrails", "Output Guardrails"),
            ("Retrieval_RAG_Guardrails", "Retrieval / RAG Guardrails"),
            ("Contextual_Dialogue_Guardrails", "Contextual / Dialogue Guardrails"),
            ("Execution_Action_Guardrails", "Execution / Action Guardrails"),
            ("Hallucination_Grounding_Guardrails", "Hallucination / Grounding Guardrails"),
            ("Privacy_Guardrails", "Privacy Guardrails"),
            ("Compliance_Guardrails", "Compliance Guardrails"),
            ("Human_in_the_Loop_Guardrails", "Human-in-the-Loop Guardrails"),
            ("Evaluation_Guardrails", "Evaluation Guardrails"),
        ],
    },
    {
        "folder": "8. Key Threats Mitigated",
        "subtopics": [
            ("Prompt_Injection", "Prompt Injection"),
            ("Jailbreaking", "Jailbreaking"),
            ("Sensitive_Information_Disclosure", "Sensitive Information Disclosure"),
            ("System_Prompt_Leakage", "System Prompt Leakage"),
            ("Insecure_Output_Handling", "Insecure Output Handling"),
            ("Excessive_Agency", "Excessive Agency"),
            ("Insecure_Tool_Plugin_Use", "Insecure Tool / Plugin Use"),
            ("Data_Poisoning", "Data Poisoning"),
            ("Supply_Chain_Risk", "Supply Chain Risk"),
            ("Model_Denial_of_Service", "Model Denial of Service"),
            ("Hallucination", "Hallucination"),
            ("Bias_and_Discrimination", "Bias and Discrimination"),
            ("Unauthorized_Actions", "Unauthorized Actions"),
            ("Financial_Misinformation", "Financial Misinformation"),
            ("Regulatory_Non_Compliance", "Regulatory Non-Compliance"),
        ],
    },
    {
        "folder": "9. Implementation Components",
        "subtopics": [
            ("Policy_Engine", "Policy Engine"),
            ("Rule_Engine", "Rule Engine"),
            ("Risk_Classifier", "Risk Classifier"),
            ("PII_Detector", "PII Detector"),
            ("Toxicity_Detector", "Toxicity Detector"),
            ("Prompt_Injection_Detector", "Prompt Injection Detector"),
            ("Schema_Validator", "Schema Validator"),
            ("Retrieval_Validator", "Retrieval Validator"),
            ("Output_Validator", "Output Validator"),
            ("Tool_Call_Validator", "Tool Call Validator"),
            ("Human_Approval_Workflow", "Human Approval Workflow"),
            ("Audit_Logger", "Audit Logger"),
            ("Monitoring_Dashboard", "Monitoring Dashboard"),
            ("Alerting_System", "Alerting System"),
            ("Evaluation_Dataset", "Evaluation Dataset"),
            ("Red_Team_Test_Suite", "Red Team Test Suite"),
        ],
    },
    {
        "folder": "10. Frameworks Tools and Libraries",
        "subtopics": [
            ("NVIDIA_NeMo_Guardrails", "NVIDIA NeMo Guardrails"),
            ("Guardrails_AI", "Guardrails AI"),
            ("OpenAI_Guardrails", "OpenAI Guardrails"),
            ("AWS_Bedrock_Guardrails", "AWS Bedrock Guardrails"),
            ("Azure_AI_Content_Safety", "Azure AI Content Safety"),
            ("LangChain_Guardrail_Patterns", "LangChain Guardrail Patterns"),
            ("LangGraph_Guardrail_Nodes", "LangGraph Guardrail Nodes"),
            ("LlamaIndex_Guardrail_Patterns", "LlamaIndex Guardrail Patterns"),
            ("Microsoft_Presidio", "Microsoft Presidio"),
            ("DeepEval", "DeepEval"),
            ("Ragas", "Ragas"),
            ("TruLens", "TruLens"),
            ("Giskard", "Giskard"),
            ("Lakera_Guard", "Lakera Guard"),
            ("Pydantic", "Pydantic"),
            ("JSON_Schema", "JSON Schema"),
            ("Regex_Validators", "Regex Validators"),
            ("Custom_ML_Classifiers", "Custom ML Classifiers"),
        ],
    },
    {
        "folder": "11. LLM Guardrails Implementation",
        "subtopics": [
            ("Define_Use_Case", "Define Use Case"),
            ("Define_Risk_Categories", "Define Risk Categories"),
            ("Define_Allowed_Behaviors", "Define Allowed Behaviors"),
            ("Define_Blocked_Behaviors", "Define Blocked Behaviors"),
            ("Define_User_Roles", "Define User Roles"),
            ("Define_Data_Access_Rules", "Define Data Access Rules"),
            ("Define_Input_Validators", "Define Input Validators"),
            ("Define_Retrieval_Validators", "Define Retrieval Validators"),
            ("Define_Tool_Validators", "Define Tool Validators"),
            ("Define_Output_Validators", "Define Output Validators"),
            ("Add_Retry_Regeneration_Logic", "Add Retry / Regeneration Logic"),
            ("Add_Human_Approval_Flow", "Add Human Approval Flow"),
            ("Add_Guardrail_Middleware", "Add Guardrail Middleware"),
            ("Add_Audit_Logging", "Add Audit Logging"),
            ("Add_Monitoring_Hooks", "Add Monitoring Hooks"),
        ],
    },
    {
        "folder": "12. Finance Investment and Asset Management Guardrails",
        "subtopics": [
            ("Financial_Advice_Guardrails", "Financial Advice Guardrails"),
            ("Investment_Recommendation_Guardrails", "Investment Recommendation Guardrails"),
            ("Suitability_Guardrails", "Suitability Guardrails"),
            ("Risk_Disclosure_Guardrails", "Risk Disclosure Guardrails"),
            ("Portfolio_Analysis_Guardrails", "Portfolio Analysis Guardrails"),
            ("Market_Research_Guardrails", "Market Research Guardrails"),
            ("Research_Report_Summarization_Guardrails", "Research Report Summarization Guardrails"),
            ("Trade_Execution_Guardrails", "Trade Execution Guardrails"),
            ("Pre_Trade_Compliance_Guardrails", "Pre-Trade Compliance Guardrails"),
            ("Post_Trade_Compliance_Guardrails", "Post-Trade Compliance Guardrails"),
            ("Insider_Information_Guardrails", "Insider Information Guardrails"),
            ("Material_Non_Public_Information_Guardrails", "Material Non-Public Information Guardrails"),
            ("Client_Data_Privacy_Guardrails", "Client Data Privacy Guardrails"),
            ("KYC_AML_Guardrails", "KYC / AML Guardrails"),
            ("Regulatory_Disclosure_Guardrails", "Regulatory Disclosure Guardrails"),
            ("Model_Risk_Management_Guardrails", "Model Risk Management Guardrails"),
            ("Human_Advisor_Approval_Guardrails", "Human Advisor Approval Guardrails"),
            ("Audit_and_Evidence_Guardrails", "Audit and Evidence Guardrails"),
        ],
    },
    {
        "folder": "13. Finance Use Cases",
        "subtopics": [
            ("Investment_Research_Assistant", "Investment Research Assistant"),
            ("Portfolio_Risk_Explanation_Assistant", "Portfolio Risk Explanation Assistant"),
            ("Fund_Fact_Sheet_Summarizer", "Fund Fact Sheet Summarizer"),
            ("Earnings_Call_Transcript_Analyzer", "Earnings Call Transcript Analyzer"),
            ("Credit_Risk_Assistant", "Credit Risk Assistant"),
            ("Market_Commentary_Generator", "Market Commentary Generator"),
            ("Compliance_Policy_Assistant", "Compliance Policy Assistant"),
            ("Client_Communication_Assistant", "Client Communication Assistant"),
            ("Internal_Knowledge_Assistant", "Internal Knowledge Assistant"),
            ("Trade_Support_Agent", "Trade Support Agent"),
            ("Due_Diligence_Assistant", "Due Diligence Assistant"),
            ("Regulatory_Filing_Assistant", "Regulatory Filing Assistant"),
        ],
    },
    {
        "folder": "14. Testing and Evaluation",
        "subtopics": [
            ("Unit_Testing", "Unit Testing"),
            ("Integration_Testing", "Integration Testing"),
            ("Prompt_Injection_Testing", "Prompt Injection Testing"),
            ("Jailbreak_Testing", "Jailbreak Testing"),
            ("PII_Leakage_Testing", "PII Leakage Testing"),
            ("Toxicity_Testing", "Toxicity Testing"),
            ("Hallucination_Testing", "Hallucination Testing"),
            ("Retrieval_Quality_Testing", "Retrieval Quality Testing"),
            ("Tool_Call_Safety_Testing", "Tool Call Safety Testing"),
            ("Human_Approval_Testing", "Human Approval Testing"),
            ("Latency_Testing", "Latency Testing"),
            ("Cost_Testing", "Cost Testing"),
            ("Regression_Testing", "Regression Testing"),
            ("Red_Team_Testing", "Red Team Testing"),
            ("Production_Shadow_Testing", "Production Shadow Testing"),
        ],
    },
    {
        "folder": "15. Production Deployment",
        "subtopics": [
            ("Guardrails_as_Middleware", "Guardrails as Middleware"),
            ("Guardrails_as_API_Gateway", "Guardrails as API Gateway"),
            ("Guardrails_inside_RAG_Pipeline", "Guardrails inside RAG Pipeline"),
            ("Guardrails_inside_Agent_Workflow", "Guardrails inside Agent Workflow"),
            ("Guardrails_inside_Tool_Wrapper", "Guardrails inside Tool Wrapper"),
            ("Guardrails_inside_Output_Parser", "Guardrails inside Output Parser"),
            ("Guardrails_with_Human_Approval_Queue", "Guardrails with Human Approval Queue"),
            ("Guardrails_with_CI_CD_Tests", "Guardrails with CI/CD Tests"),
            ("Guardrails_with_Observability_Stack", "Guardrails with Observability Stack"),
            ("Guardrails_with_Compliance_Dashboard", "Guardrails with Compliance Dashboard"),
        ],
    },
    {
        "folder": "16. Production Monitoring",
        "subtopics": [
            ("Guardrail_Pass_Rate", "Guardrail Pass Rate"),
            ("Guardrail_Fail_Rate", "Guardrail Fail Rate"),
            ("Violation_Categories", "Violation Categories"),
            ("Prompt_Injection_Attempts", "Prompt Injection Attempts"),
            ("PII_Leakage_Attempts", "PII Leakage Attempts"),
            ("Hallucination_Rate", "Hallucination Rate"),
            ("Unsupported_Claim_Rate", "Unsupported Claim Rate"),
            ("Retrieval_Grounding_Score", "Retrieval Grounding Score"),
            ("Tool_Call_Risk_Score", "Tool Call Risk Score"),
            ("Human_Escalation_Rate", "Human Escalation Rate"),
            ("User_Feedback_Score", "User Feedback Score"),
            ("Latency_Impact", "Latency Impact"),
            ("Cost_Impact", "Cost Impact"),
            ("Audit_Trail_Completeness", "Audit Trail Completeness"),
            ("Policy_Drift", "Policy Drift"),
            ("Model_Behavior_Drift", "Model Behavior Drift"),
        ],
    },
]

def make_notebook(title: str) -> dict:
    return {
        "cells": [
            {
                "cell_type": "markdown",
                "metadata": {},
                "source": [f"# {title}\n"],
            },
            {
                "cell_type": "markdown",
                "metadata": {},
                "source": [
                    "## Notes\n\n",
                    "- \n",
                ],
            },
        ],
        "metadata": {
            "kernelspec": {
                "display_name": "Python 3",
                "language": "python",
                "name": "python3",
            },
            "language_info": {
                "name": "python",
                "version": "3.x",
            },
        },
        "nbformat": 4,
        "nbformat_minor": 5,
    }

created_files = 0

for topic in topics:
    folder_path = BASE_DIR / topic["folder"]
    folder_path.mkdir(parents=True, exist_ok=True)

    for index, (file_slug, heading) in enumerate(topic["subtopics"], start=1):
        filename = f"{index}.{file_slug}.ipynb"
        notebook_path = folder_path / filename

        with notebook_path.open("w", encoding="utf-8") as f:
            json.dump(make_notebook(heading), f, indent=2, ensure_ascii=False)

        created_files += 1

print("✅ Guardrails notebook structure created successfully.")
print(f"📁 Base directory: {BASE_DIR}")
print(f"📘 Total notebooks created: {created_files}")
print("🚀 Open the folder in VS Code or Jupyter to start writing notes.")
PY

echo ""
echo "Done."
echo "Created notebooks inside: $BASE_DIR"
