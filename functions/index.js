const functions = require("firebase-functions");
const admin = require("firebase-admin");
const sgMail = require("@sendgrid/mail");

admin.initializeApp();

const SENDGRID_API_KEY = process.env.SENDGRID_API_KEY;
sgMail.setApiKey(SENDGRID_API_KEY);

exports.sendVerificationCode = functions.https.onCall(async (data, context) => {
  const email = data.email;
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
    return { result: "Código enviado con éxito" };
  } catch (error) {
    console.error(error);
    throw new functions.https.HttpsError(
      "internal",
      "Error al enviar el código"
    );
  }
});

exports.testFunction = functions.https.onCall(async (data, context) => {
  console.log("Test function started");
  return { result: "Test function executed successfully" };
});
