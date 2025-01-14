import {
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  Box,
  TextField,
} from '@mui/material';
import { PigQR } from './PigQR';
import { useRef, useState } from 'react';

export const AllPigsQRModal = ({
  pigs,
  isOpen,
  onClose,
}: {
  pigs: any[];
  isOpen: boolean;
  onClose?: () => void;
}) => {
  const [widthPX, setWidthPX] = useState(192);
  const [heightPX, setHeightPX] = useState(144);
  const [fontPX, setFontPX] = useState(40);

  const handlePrint = () => {
    window.print();
  };

  return (
    <Dialog open={isOpen} onClose={onClose} fullWidth maxWidth="xl">
      <DialogTitle>VIEW ALL ALIVE PIGS QR</DialogTitle>
      <DialogContent>
        <style>
          {`
            @media print {
              body * {
                visibility: hidden;
              }
              .print_content, .print_content * {
                visibility: visible;
              }
              .print_content {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
              }
            }
          `}
        </style>
        <Box p={3}>
          <Box p={3} display="flex" gap={2}>
            <TextField
              label="QR Width"
              size="small"
              value={widthPX}
              type="number"
              onChange={(v) => setWidthPX(parseInt(v.target.value))}
            />
            <TextField
              label="QR Height"
              size="small"
              value={heightPX}
              type="number"
              onChange={(v) => setHeightPX(parseInt(v.target.value))}
            />
            <TextField
              label="Font Size"
              size="small"
              value={fontPX}
              type="number"
              onChange={(v) => setFontPX(parseInt(v.target.value))}
            />
          </Box>
          <Box
            className="print_content"
            display="flex"
            flexWrap="wrap"
            justifyContent="space-evenly"
            gap={2}
          >
            {pigs
              .filter((pig: any) => pig.status === 'alive')
              .sort((a, b) => a.pigNumber.localeCompare(b.pigNumber))
              .map((pig) => (
                <Box key={pig.uuid}>
                  <PigQR
                    label={pig.pigNumber.replace('P-', '')}
                    qrValue={pig.uuid}
                    widthPX={widthPX}
                    heightPX={heightPX}
                    fontPX={fontPX}
                  />
                </Box>
              ))}
          </Box>
        </Box>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Close
        </Button>
        <Button onClick={() => handlePrint()} color="primary">
          Download
        </Button>
      </DialogActions>
    </Dialog>
  );
};
