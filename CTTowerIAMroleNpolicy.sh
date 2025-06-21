#!/bin/bash
echo "Running script..."
aws iam create-role --role-name AWSControlTowerAdmin --path /service-role/ --assume-role-policy-document file://controltower_trust.json
aws iam put-role-policy --role-name AWSControlTowerAdmin --policy-name AWSControlTowerAdminPolicy --policy-document file://ct_admin_role_policy.json
aws iam attach-role-policy --role-name AWSControlTowerAdmin --policy-arn arn:aws:iam::aws:policy/service-role/AWSControlTowerServiceRolePolicy
aws iam create-role --role-name AWSControlTowerCloudTrailRole --path /service-role/ --assume-role-policy-document file://cloudtrail_trust.json
aws iam put-role-policy --role-name AWSControlTowerCloudTrailRole --policy-name AWSControlTowerCloudTrailRolePolicy --policy-document file://cloudtrail_role_policy.json
aws iam create-role --role-name AWSControlTowerStackSetRole --path /service-role/ --assume-role-policy-document file://cloudformation_trust.json
aws iam put-role-policy --role-name AWSControlTowerStackSetRole --policy-name AWSControlTowerStackSetRolePolicy --policy-document file://stackset_role_policy.json
aws iam create-role --role-name AWSControlTowerConfigAggregatorRoleForOrganizations --path /service-role/ --assume-role-policy-document file://config_trust.json
aws iam attach-role-policy --role-name AWSControlTowerConfigAggregatorRoleForOrganizations --policy-arn arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations
