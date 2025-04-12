const functions = require("firebase-functions");
const { defineSecret } = require("firebase-functions/params");
const admin = require("firebase-admin");
const sgMail = require("@sendgrid/mail");

admin.initializeApp();

const SENDGRID_API_KEY = defineSecret("SENDGRID_API_KEY");

exports.sendVerificationCode = functions.https.onCall(
  { secrets: [SENDGRID_API_KEY] },
  async (data, context) => {
    const email = data.data.email;
    if (!email) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "No se recibió el parámetro 'email'."
      );
    }

    sgMail.setApiKey(SENDGRID_API_KEY.value());

    const code = Math.floor(100000 + Math.random() * 900000).toString();

    const msg = {
      to: email,
      from: "samuelmauriciolaime@gmail.com",
      subject: "Tu Código de Verificación",
      text: `Tu código de verificación es: ${code}`,
      html: `<strong>Tu código de verificación es: ${code}</strong>`,
    };

    try {
      await sgMail.send(msg);
      await admin.firestore().collection("verificationCodes").doc(email).set({
        code: code,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });
      return { result: "Código " + code + " enviado con éxito a " + email };
    } catch (error) {
      console.error(error);
      throw new functions.https.HttpsError(
        "internal",
        "Error al enviar el código"
      );
    }
  }
);
