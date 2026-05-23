# Frequently Asked Questions (FAQ)

## General Questions

### What is WonderTales Hub?
WonderTales Hub is an AI-powered platform that generates personalized bedtime stories for children with professional voice narration.

### How does it work?
1. Create a child profile with age and interests
2. Select a theme (bedtime, adventure, etc.)
3. AI generates a unique story
4. Listen to professional narration
5. Save and share your favorite stories

### Is it free?
The platform offers both free and premium features. Basic story generation is free, while voice cloning and advanced features require a subscription.

### What ages is it suitable for?
WonderTales is designed for children aged 2-12 years, with content automatically adapted to the child's age.

## Technical Questions

### What technologies are used?
- **Backend**: Django + Django REST Framework
- **AI**: OpenAI GPT-4o
- **Voice**: ElevenLabs TTS
- **Frontend**: React + TypeScript + Vite
- **Database**: PostgreSQL
- **Deployment**: Docker + AWS

### Can I self-host it?
Yes! The project is open-source and can be self-hosted. See the deployment guide for instructions.

### What are the system requirements?
- **Minimum**: 2 vCPUs, 4GB RAM, 20GB storage
- **Recommended**: 4 vCPUs, 8GB RAM, 40GB storage

### Does it work offline?
Currently, an internet connection is required for AI story generation and voice narration. Offline mode is planned for future releases.

## Story Generation

### How long does it take to generate a story?
Typically 10-30 seconds depending on story length and server load.

### Can I customize the stories?
Yes! You can specify:
- Child's name, age, and interests
- Story theme and length
- Narrator voice
- Language

### What languages are supported?
Currently supports English and Bengali, with more languages planned.

### Can I edit generated stories?
Yes, you can edit story text before saving or sharing.

## Voice Narration

### What voices are available?
- 2 primary narrators (male/female)
- 2 secondary narrators
- 2 child voices
- Custom cloned voices (premium)

### How does voice cloning work?
Upload 1-5 minutes of clear speech audio, and our AI will create a custom voice model. Requires ElevenLabs Creator plan or higher.

### Can I download the audio?
Yes, all narrated stories can be downloaded as MP3 files.

## Account & Privacy

### Is my data secure?
Yes, we use industry-standard encryption and security practices. See our Security Policy for details.

### Can I delete my account?
Yes, you can delete your account and all associated data at any time from account settings.

### Do you share my data?
No, we never share personal data with third parties. See our Privacy Policy for details.

### Can I export my stories?
Yes, you can export all your stories as JSON, PDF, or audio files.

## Troubleshooting

### Story generation failed
- Check your internet connection
- Verify API keys are configured
- Try again in a few minutes
- Contact support if issue persists

### Audio not playing
- Check browser audio permissions
- Try a different browser
- Clear browser cache
- Ensure audio file downloaded successfully

### Can't log in
- Verify email and password
- Check for typos
- Try password reset
- Clear browser cookies

## Billing & Subscription

### What payment methods are accepted?
Credit/debit cards, PayPal, and local payment methods (varies by region).

### Can I cancel anytime?
Yes, you can cancel your subscription at any time. Access continues until the end of the billing period.

### Is there a refund policy?
Yes, we offer a 30-day money-back guarantee for annual subscriptions.

## Support

### How do I get help?
- Check this FAQ
- Read the documentation
- Email: mehedi259@gmail.com
- GitHub Issues: Report bugs

### Can I contribute?
Yes! We welcome contributions. See CONTRIBUTING.md for guidelines.

### Where can I report bugs?
Report bugs on our GitHub Issues page or email support.

## Future Features

### Will there be a mobile app?
Yes, a React Native mobile app is in development.

### Will you add more languages?
Yes, we plan to add support for 20+ languages.

### Can I suggest features?
Absolutely! Open a feature request on GitHub or email us.
