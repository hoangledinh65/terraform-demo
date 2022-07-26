1. Encryption
aws kms encrypt \
    --key-id alias/hoangdl-key1 \
    --plaintext fileb://ExamplePlaintextFile \
    --output text \
    --query CiphertextBlob | base64 \
    --decode > ExampleEncryptedFile

2. Decryption
aws kms decrypt \
    --ciphertext-blob fileb://ExampleEncryptedFile \
    --key-id alias/hoangdl-key1 \
    --output text \
    --query Plaintext | base64 \
    --decode > ExamplePlaintextFile2

3. Parameter store
aws ssm get-parameters --names hoangdl-password-prod  hoangdl-username-prod --with-decryption