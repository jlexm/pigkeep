import { Box, Typography } from '@mui/material';
import { QRCodeSVG } from 'qrcode.react';
import { forwardRef } from 'react';

export const PigQR = forwardRef<
  HTMLElement,
  {
    label: string;
    qrValue: string;
    widthPX?: number;
    heightPX?: number;
    fontPX?: number;
  }
>(({ label, qrValue, widthPX = 192, heightPX = 144, fontPX = 40 }, ref) => {
  return (
    <Box>
      <Box
        ref={ref}
        sx={{
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          backgroundColor: 'white', // Ensure background is white for the image
          padding: 2,
        }}
      >
        <Typography variant="h4" fontWeight="bold" fontSize={fontPX}>
          {label}
        </Typography>
        <QRCodeSVG
          value={qrValue}
          size={200}
          width={`${widthPX}px`}
          height={`${heightPX}px`}
        />
      </Box>
    </Box>
  );
});
