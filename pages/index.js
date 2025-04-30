import React from 'react'

export default function Home() {
  return (
    <div style={{ padding: '50px', fontFamily: 'Arial, sans-serif', maxWidth: '800px', margin: '0 auto' }}>
      <h1 style={{ color: '#DD4803' }}>Sophia Reynolds - UX Designer Portfolio</h1>
      <p>Welcome to my portfolio site! This is a fallback page - the main site is still being configured.</p>
      
      <div style={{ padding: '20px', backgroundColor: '#f5f5f5', borderRadius: '10px', marginTop: '20px' }}>
        <h2>Please visit the main portfolio at:</h2>
        <p><a href="/resume-2023-new" style={{ color: '#DD4803' }}>Full Portfolio</a></p>
      </div>
      
      <p style={{ marginTop: '40px', color: '#666' }}>If you're seeing this page, we're still setting up the AWS deployment.</p>
    </div>
  )
} 